class Shoes::Types::Add_button < Shoes::Widget

  def initialize(&block)
    self.width = 16
    self.height = 16
    @pic = image(image_path)
    onclick(&block)
  end
  
  def onclick(&block)
    @pic.click { block.call() if block }
  end
  
  def image_path
    File.dirname(__FILE__) + "/../Resources/add-16.png"
  end 
  
end
