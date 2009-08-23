require File.dirname(__FILE__) + "/NDots.rb"

class Shoes::Labelled_dots < Shoes::Widget
  attr_reader :label, :dots

  def initialize(label, default_value, opts = {}, &block)
    @label_text = label.to_s
    stack :width => (opts[:label_width] || 100) do
      @label = para @label_text + ':'
    end
    stack :width => '50%' do
      @dots = ndots(5, default_value, default_value)
      dots.on_changed(&block)
    end
  end
  
end
