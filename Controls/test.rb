require File.dirname(__FILE__) + "/NDots.rb"

Shoes.app :title => "Darkblade" do
  stack :width => '50%' do
    @label = para 'int'    
  end
  stack :width => '50%' do
    @dots = ndots(5, 1, 1) 
  end
end
