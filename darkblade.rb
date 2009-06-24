require File.dirname(__FILE__) + "/Model/Attributes.rb"
require File.dirname(__FILE__) + "/Model/Skills.rb"
require File.dirname(__FILE__) + "/Model/Character.rb"
require File.dirname(__FILE__) + "/Lib/Utils.rb"
require File.dirname(__FILE__) + "/Controls/NDots.rb"
require File.dirname(__FILE__) + "/Controls/LabelledDots.rb"

APP_WIDTH = 750
CHARACTER_FILE_EXTENSION = '.char'

class MainScreen < Shoes
  url '/', :index
  
  def index
    background("background.jpg", :curve => 12)
    @character = Character.new
    @attr_ldots = {}
    
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
          @attr_ldots.each do |attrib, dots|
            dots.dots.original_value = @character.original_attrs[attrib]
            dots.dots.final_value = @character.final_attrs[attrib]
            character_changed
          end # Set each of the dots values.
          @character_name_edit.text = @character.name
        end # If loaded OK
      end # Load
    end
    
    ATTRS_BY_TYPE.each do |attrs|
      stack :width => '33%' do
        attrs.each do |attrib|
          current = labelled_dots attrib, 100, 1 do |dots|
            @character.original_attrs[attrib] = dots.original_value
            @character.final_attrs[attrib] = dots.final_value
            character_changed
          end
          @attr_ldots[attrib] = current
        end
      end
    end
    
    stack do
      @starting_attr_values = para ''  
      @attrs_xp_spent = para ''
    end
    
    SKILLS_BY_TYPE.each do |skills|
      stack :width => '33%' do
        skills.each do |skill|
          current = labelled_dots skill, 110, 0 do |dots|
            @character.original_skills[skill] = dots.original_value
            @character.final_skills[skill] = dots.final_value
            character_changed
          end
          @attr_ldots[skill] = current
        end
      end
    end
    
    stack do
      @starting_skills_values = para ''  
      @skills_xp_spent = para ''
    end
    
    character_changed
  end # index

private
  
  def character_changed
    @starting_attr_values.text = "Starting attribute points spent are #{@character.original_attrs.starting_point_costs.inspect}. You may use [3, 4, 5] in any order."
    @attrs_xp_spent.text = "So far, this character has spent #{@character.attrs_xp_cost} xp on attributes"
    
    @starting_skills_values.text = "Starting skill points spent are #{@character.original_skills.starting_point_costs.inspect}. You may use [4, 7, 11] in any order."
    @skills_xp_spent.text = "So far, this character has spent #{@character.skills_xp_cost} xp on skills"
  end

end

Shoes.app :title => "Darkblade", :width => APP_WIDTH, :height => 800
