# A switch with three selection states. 
# By default, it can only move up in selection states (order = deselected -> final -> original) - other behavior is created using the onchange event.
# It can also be disabled, which prevents the user from selecting or triggering events.

LEFT_BUTTON = [1]
RIGHT_BUTTON = [2, 3]

OvalWidth = 12
OvalHeight = 14

DisabledColor = "#000000"
OutlineColor = "#000000"
OutlineWidth = 2

class Shoes::Onedot < Shoes::Widget
  attr_reader :last_click, :enabled
  
  def initialize(opts = {})
    super()
    @enabled = true
    @last_click = :original
    @selected = opts[:selected]
    @selected_color = opts[:selected_color]
    self.width = 20
    self.height = 20
    flow :height => 20, :width => 20  do
      draw_dot
      parent.click do |button, x, y|
        if RIGHT_BUTTON.index(button) then
          @last_click = :final
          self.final_selected = (true)
        elsif LEFT_BUTTON.index(button) then
          @last_click = :original
          self.original_selected = true
        end # if button clicked = left/right
      end # Parent click event
    end # within a flow
  end # initialize

  def enabled=(val)
    @enabled = val
    changed
  end

  def on_changed(&block)
    @on_changed = block
  end
  
  def set_selection_without_onchange(original, final)
    @original_selected, @final_selected = original, final
    fill_dot
  end
  
  def final_selected
    @final_selected
  end
  
  def final_selected=(value)
    @final_selected = value
    changed
  end
  
  def original_selected
    @original_selected
  end
  
  def original_selected=(value)
    @original_selected = value
    changed
  end
  
  def original_selected_color
    @original_selected_color || royalblue
  end
  
  def original_selected_color=(value)
    @original_selected_color = value
    fill_dot if selected
  end
  
  def final_selected_color
    @final_selected_color || tomato
  end
  
  def final_selected_color=(value)
    @final_selected_color = value
    fill_dot if selected
  end
  
  def deselected_color
    @deselected_color || "#CCCCCC"
  end
  
  def deselected_color=(value)
    @deselected_color = value
    fill_dot if not selected
  end
  
  private
  
  def draw_dot
    stroke OutlineColor
    strokewidth OutlineWidth
    @oval = oval(4, 3, OvalWidth, OvalHeight)
    fill_dot
  end
    
  def fill_color
    if @enabled then
      if original_selected then
        original_selected_color
      else
        final_selected ? final_selected_color : deselected_color
      end
    else
      DisabledColor
    end
  end
    
  def fill_dot
    @oval.fill = fill_color
  end
  
  def changed
    @on_changed.call(self) if @on_changed and @enabled
    fill_dot
  end
  
end
