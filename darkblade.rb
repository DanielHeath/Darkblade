require File.dirname(__FILE__) + "/Model/Character/Character.rb"
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
    
    view_objects.each do |view| 
      view.add_components(self)
    end
    
    set_character(character)
  end # index
  
  def character_changed
    # Ugly; not yet sure how to simplify the mapping between these.
    View::Attributes.instance.set_starting_points(@character.original_attrs.starting_point_costs.inspect)
    View::Attributes.instance.set_xp_spent @character.attrs_xp_cost
    View::Skills.instance.set_starting_points(@character.original_skills.starting_point_costs.inspect)
    View::Skills.instance.set_xp_spent @character.skills_xp_cost
    View::Specializations.instance.set_xp_spent @character.specializations_xp_cost
  end

private

  def set_character(character)
    @character = character
    view_objects.each do |view|
      view.update(@character)
    end
    
    @character_name_edit.text = @character.name
    @save_button.click do
      @character.save(ask_save_file)
    end # Save
    character_changed
  end

  def view_objects
    # Next iteration:
    [#View::Header.instance, (replace current inline header, add background/concept)
    #View::Faction.instance, (mortal, mage path, vampire clan, werewolf ??)
    #View::Nature.instance, (virtue/vice)
    View::Attributes.instance,
    View::Skills.instance,
    View::Specializations.instance
    #,View::Merits.instance (to support merits - going to be the most complex, methinks.)
    ]
  end
  
end

Shoes.app :title => "Darkblade", :width => APP_WIDTH, :height => 800
