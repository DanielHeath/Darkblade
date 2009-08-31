class Shoes::Types::Remove_button < Shoes::Widget

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
    File.dirname(__FILE__) + "/../Resources/delete-16.png"
  end 
  
end
