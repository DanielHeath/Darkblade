module View;end
require File.dirname(__FILE__) + "/Controls/RemoveButton.rb"
require File.dirname(__FILE__) + "/Controls/AddButton.rb"
require File.dirname(__FILE__) + "/Controls/LabelledDots.rb"
require File.dirname(__FILE__) + "/Base.rb"
require File.dirname(__FILE__) + "/Attributes.rb"
require File.dirname(__FILE__) + "/Skills.rb"
require File.dirname(__FILE__) + "/Specializations.rb"
require File.dirname(__FILE__) + "/Merits.rb"

class MainScreen < Shoes
  url '/', :index
  
  def index
    background(BACKGROUND_FILE, :curve => 12)
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
    
    flow :width => '100%' do
      background bisque
      view_objects.each do |view| 
        view.add_caption(self)
      end
    end
    view_objects.each do |view| 
      view.add_components(self)
    end
    
    set_tab View::Attributes.instance
    
    set_character(character)
  end # index
  
  def character_changed
    # Ugly; not yet sure how to simplify the mapping between these.
    View::Attributes.instance.set_starting_points(@character.original_attrs.starting_point_costs.inspect)
    View::Attributes.instance.set_xp_spent @character.attrs_xp_cost
    View::Skills.instance.set_starting_points(@character.original_skills.starting_point_costs.inspect)
    View::Skills.instance.set_xp_spent @character.skills_xp_cost
    View::Specializations.instance.set_xp_spent @character.specializations_xp_cost
    View::Merits.instance.set_starting_points @character.original_merits.starting_point_cost
    View::Merits.instance.set_xp_spent @character.merits_xp_cost
  end

  def set_tab(current_view)
    view_objects.each do |view| 
      view.hide
    end
    current_view.show
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
    # Coming Soon...
    [#View::Header.instance, (replace current inline header, add background/concept)
    #View::Faction.instance, (mortal, mage path, vampire clan, werewolf ??)
    #View::Nature.instance, (virtue/vice)
    View::Attributes.instance,
    View::Skills.instance,
    View::Specializations.instance,
    View::Merits.instance]
  end
  
end
