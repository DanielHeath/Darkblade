require File.dirname(__FILE__) + "/Model/Character.rb"
require File.dirname(__FILE__) + "/Lib/Utils.rb"
require File.dirname(__FILE__) + "/View/Attributes.rb"
require File.dirname(__FILE__) + "/View/Skills.rb"
require File.dirname(__FILE__) + "/View/Specializations.rb"

APP_WIDTH = 750
CHARACTER_FILE_EXTENSION = '.char'

class MainScreen < Shoes
  url '/', :index
  attr_reader :attribute_labelled_dots, :skill_labelled_dots
  
  def index
    background("background.jpg", :curve => 12)
    @character = Model::Character.new
    @attribute_labelled_dots = {}
    @skill_labelled_dots = {}
    
    flow do
      para "Name:"
      @character_name_edit = edit_line(:text => "Character Name")
      @character_name_edit.change do |edit| 
        @character.name = edit.text
      end
      @character.name = @character_name_edit.style[:text]
    
      button "Save" do
        @character.save(ask_save_file)
      end # Save
      
      button "Load" do
        new = Character.load(ask_open_file)
        if new then
          @character = new
          @attribute_labelled_dots.each do |attrib, dots|
            dots.dots.original_value = @character.original_attrs[attrib]
            dots.dots.final_value = @character.final_attrs[attrib]
            character_changed
          end # Set each of the dots values.
          @character_name_edit.text = @character.name
        end # If loaded OK
      end # Load
    end
    
    View::Attributes.instance.add_components(self, @character)
    View::Skills.instance.add_components(self, @character)
    View::Specializations.instance.add_components(self, @character)
    
    character_changed
  end # index

  def character_changed
    View::Attributes.instance.set_starting_points(@character.original_attrs.starting_point_costs.inspect)
    View::Attributes.instance.set_xp_spent @character.attrs_xp_cost
    View::Skills.instance.set_starting_points(@character.original_skills.starting_point_costs.inspect)
    View::Skills.instance.set_xp_spent @character.skills_xp_cost
    View::Specializations.instance.set_xp_spent @character.specializations_xp_cost
  end

end

Shoes.app :title => "Darkblade", :width => APP_WIDTH, :height => 800
