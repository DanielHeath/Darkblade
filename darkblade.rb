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
    @character = Model::Character.new
    
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
        new = Model::Character.load(ask_open_file)
        if new then
          @character = new
          View::Attributes.instance.update(@character)
          View::Skills.instance.update(@character)
          View::Specializations.instance.update(@character)
          @character_name_edit.text = @character.name
          character_changed
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
