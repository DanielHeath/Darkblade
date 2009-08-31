require File.dirname(__FILE__) + "/OneDot.rb"

class Shoes::Types::Ndots < Shoes::Widget
  attr_reader :original_value, :final_value
  
  def initialize(dots, original, final, enabled_dots = nil)
    @num_dots = dots
    @enabled_dots = enabled_dots || ((1..dots).to_a)
    @original_value = original
    @final_value = final
    @dots = []
    dot_indices.each do |i|
      @dots[i-1] = create_dot(i)
    end
    privsetvalue(:original, original)
    privsetvalue(:final, final)
    changed
  end

  def on_changed(&block)
    @on_changed = block
  end
  
  def original_value=(orig_value)
    valid_value!(orig_value)
    privsetvalue(:original, orig_value)
  end
  
  def final_value=(final_value)
    valid_value!(final_value)
    privsetvalue(:final, final_value)
  end
  
private

  def dots(index)
    # the first dot indicates 1, the second 2 etc - so it makes more sense to use a 1-based index.
    @dots[index-1]
  end
  
  def changed
    @on_changed.call(self) if @on_changed 
  end
  
  def valid_values
    (0..@num_dots).to_a
  end
  
  def dot_indices
    (1..@num_dots).to_a
  end
  
  def valid_value!(value)
    raise "Invalid value #{value} should be within 0-#{@num_dots}." if !valid_value?(value)
  end
  
  def valid_value?(value)
    valid_values.include? value
  end
  
  def create_dot(index)
    res = onedot
    res.enabled = @enabled_dots.to_a.include? index
    res.on_changed do |dot|
      valid_value!(index)
      
      # The first valid dot acts as a toggle; the others can't be unset by clicking them directly.
      if (index == values(dot.last_click)) and
         (index == minimum_enabled) then
        privsetvalue dot.last_click, 0
      else
        privsetvalue dot.last_click, index
      end
      changed
    end
    res
  end
  
  def minimum_enabled
    (@enabled_dots.to_a - [0]).min
  end
  
  def values(symbol)
    if symbol == :original then
      @original_value
    else
      @final_value
    end
  end
  
  
public
  # I need to find a better way to do this awful hack. 
  def privsetvalue(val_type, new_value)
    if val_type == :original then
      @original_value = new_value
      @final_value = new_value if (new_value > @final_value)
    elsif val_type == :final
      @final_value = new_value
      @original_value = new_value if (new_value < @original_value)
    end
    
    dot_indices.each do |i|
      dots(i).set_selection_without_onchange(i <= @original_value, i <= @final_value)
    end
  end
  
end
