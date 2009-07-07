require File.dirname(__FILE__) + "/../Model/Attributes.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/Controls/LabelledDots.rb"
require File.dirname(__FILE__) + "/../Rules.rb"
require File.dirname(__FILE__) + "/../Strings.rb"
require 'singleton'

module View;end

class View::Attributes
  include Singleton
  attr_reader :attribute_dots
  
  def add_components(app, character)
    ATTRS_BY_TYPE.each do |attrs|
      app.stack :width => '33%' do
        attrs.each do |attrib|
          current = app.labelled_dots attrib, 100, 1 do |dots|
            character.original_attrs[attrib] = dots.original_value
            character.final_attrs[attrib] = dots.final_value
            app.character_changed
          end
          app.attribute_labelled_dots[attrib] = current
        end
      end
    end
    
    app.stack do
      @starting_attr_values = app.para ''  
      @attrs_xp_spent = app.para ''
    end
    
  end
  
  def set_starting_points(starting_points)
    @starting_attr_values.text = Strings.starting_attribute_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @attrs_xp_spent.text = Strings.attribute_xp_spent(xp)
  end
  
end