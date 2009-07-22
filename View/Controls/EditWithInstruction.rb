# 
# 

class Shoes::InstructionEdit < Shoes::Widget
  
  attr_reader :edit
  
  def initialize(opts = {})
    super()
    @edit = edit_line
    @edit.change do { self.changed }
  end # initialize

  def on_changed(&block)
    @on_changed = block
  end
  
  
end
