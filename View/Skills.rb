require File.dirname(__FILE__) + "/../Model/Skills.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/Controls/LabelledDots.rb"
require 'singleton'

module View;end

class View::Skills
  include Singleton
  
  def add_components(app)
    @app = app
    
    app.flow do
      app.caption "Skills"
    end
    
    @labelled_dots = {}
    
    SKILLS_BY_TYPE.each do |skills|
      app.stack :width => '33%' do
        skills.each do |skill|
          @labelled_dots[skill] = app.labelled_dots skill, 0, :label_width => 100
        end
      end
    end    
    
    app.stack do
      @starting_skill_values = app.para ''  
      @skills_xp_spent = app.para ''
    end
  end
  
  def update(character)
    @labelled_dots.each do |skill, ld|
      ld.dots.original_value = character.original_skills[skill] || 0
      ld.dots.final_value = character.final_skills[skill] || 0
      
      ld.dots.on_changed do |dots|
        character.original_skills[skill] = dots.original_value
        character.final_skills[skill] = dots.final_value
        @app.character_changed
      end # New onchanged event to use new character.
      
    end # each labelled_dots control
  end # update(character)
  
  def set_starting_points(starting_points)
    @starting_skill_values.text = Strings.starting_skill_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @skills_xp_spent.text = Strings.skill_xp_spent(xp)
  end
  
end