require File.dirname(__FILE__) + "/OneDot.rb"

class Shoes::Ndots < Shoes::Widget
  
  def initialize(dots, original, final, valid = nil)
    @valid = valid || (0..dots)
    
    @num_dots = dots
    @values = {:original => original, :final => final}
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
  
  def original_value
    @values[:original]
  end
  
  def final_value
    @values[:final]
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
    @valid.to_a
  end
  
  def dot_indices
    (1..@num_dots)
  end
  
  def valid_value!(value)
    raise "Invalid value #{value} should be within 0-#{@num_dots}." if !valid_value?(value)
  end
  
  def valid_value?(value)
    valid_values.include? value
  end
  
  def create_dot(index)
    res = onedot
    res.enabled = valid_value? index
    res.on_changed do |dot|
      valid_value!(index)
      
      # The first dot acts as a toggle; the others can't be unset by clicking them directly.
      if (index == 1) && (@values[dot.last_click] == 1) then
        privsetvalue dot.last_click, 0
      else
        privsetvalue dot.last_click, index
      end
      changed
    end
    res
  end
  
public
  # I need to find a better way to do this awful hack. 
  def privsetvalue(val_type, new_value)
    if val_type == :original then
      @values[:original] = new_value
      @values[:final] = new_value if (new_value > @values[:final])
    elsif val_type == :final
      @values[:final] = new_value
      @values[:original] = new_value if (new_value < @values[:original])
    end
    
    valid_values.each do |i|
      dots(i).set_selection_without_onchange(i <= @values[:original], i <= @values[:final])
    end
  end
  
end
