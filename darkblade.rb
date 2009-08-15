require File.dirname(__FILE__) + "/Model/Character.rb"
require File.dirname(__FILE__) + "/Lib/Utils.rb"
require File.dirname(__FILE__) + "/View/Attributes.rb"
require File.dirname(__FILE__) + "/View/Skills.rb"
require File.dirname(__FILE__) + "/View/Specializations.rb"

APP_WIDTH = 750
CHARACTER_FILE_EXTENSION = '.char'

class MainScreen < Shoes
  url '/', :index
  
  def index
    background("background.jpg", :curve => 12)
    character = Model::Character.new
    
    flow do
      para "Name:"
      @character_name_edit = edit_line(:text => "Character Name")
      @character_name_edit.change do |edit| 
        character.name = edit.text
      end
      character.name = @character_name_edit.style[:text]
      
      @save_button = button "Save"
      
      button "Load" do
        new = Model::Character.load(ask_open_file)
        set_character(new) if new
      end # Load
    end
    
    View::Attributes.instance.add_components(self)
    View::Skills.instance.add_components(self)
    View::Specializations.instance.add_components(self)
    
    set_character(character)
  end # index
  
  def character_changed
    View::Attributes.instance.set_starting_points(@character.original_attrs.starting_point_costs.inspect)
    View::Attributes.instance.set_xp_spent @character.attrs_xp_cost
    View::Skills.instance.set_starting_points(@character.original_skills.starting_point_costs.inspect)
    View::Skills.instance.set_xp_spent @character.skills_xp_cost
    View::Specializations.instance.set_xp_spent @character.specializations_xp_cost
  end

private

  def set_character(character)
    @character = character
    View::Attributes.instance.update(@character)
    View::Skills.instance.update(@character)
    View::Specializations.instance.update(@character)
    @character_name_edit.text = @character.name
    @save_button.click do
      @character.save(ask_save_file)
    end # Save
    character_changed
  end

end

Shoes.app :title => "Darkblade", :width => APP_WIDTH, :height => 800
