require File.dirname(__FILE__) + "/../Model/Attributes.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/Controls/LabelledDots.rb"
require File.dirname(__FILE__) + "/../Model/Rules/Attributes.rb"
require File.dirname(__FILE__) + "/../Strings.rb"
require 'singleton'

module View;end

class View::Attributes
  include Singleton
  attr_reader :attribute_dots
  
  def add_components(app)
    @app = app
    @labelled_dots = {}
    
    app.flow do
      app.caption "Attributes"
    end
    
    ATTRS_BY_TYPE.each do |type|
      app.stack :width => '33%' do
        type.each do |attrib|
          @labelled_dots[attrib] = app.labelled_dots attrib, 1, :label_width => 100
        end
      end
    end
    
    app.stack do
      @starting_attr_values = app.para ''  
      @attrs_xp_spent = app.para ''
    end
  end
  
  def update(character)
    @labelled_dots.each do |attrib, ld|
      ld.dots.original_value = character.original_attrs[attrib] || 1
      ld.dots.final_value = character.final_attrs[attrib] || 1
      
      ld.dots.on_changed do |dots|
        character.original_attrs[attrib] = dots.original_value
        character.final_attrs[attrib] = dots.final_value
        @app.character_changed
      end # New onchanged event to use new character.
      
    end # each labelled_dots control
  end # update(character)
  
  def set_starting_points(starting_points)
    @starting_attr_values.text = Strings.starting_attribute_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @attrs_xp_spent.text = Strings.attribute_xp_spent(xp)
  end
  
end