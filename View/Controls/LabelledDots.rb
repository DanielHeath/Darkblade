require File.dirname(__FILE__) + "/NDots.rb"

class Shoes::Labelled_dots < Shoes::Widget
  attr_reader :label, :dots

  def initialize(label, label_width, default_value, &block)
    @label_text = label.to_s.capitalize.gsub '_', ' '
    stack :width => label_width do
      @label = para @label_text + ':'
    end
    stack :width => '50%' do
      @dots = ndots(5, default_value, default_value)
      dots.on_changed(&block)
    end
  end
  
end