require File.dirname(__FILE__) + "/../Model/Skills.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/Controls/LabelledDots.rb"
require 'singleton'

module View;end

class View::Skills
  include Singleton
  attr_reader :skill_dots
  
  def add_components(app, character)
    SKILLS_BY_TYPE.each do |skills|
      app.stack :width => '33%' do
        skills.each do |skill|
          current = app.labelled_dots skill, 100, 0 do |dots|
            character.original_skills[skill] = dots.original_value
            character.final_skills[skill] = dots.final_value
            app.character_changed
          end
          app.skill_labelled_dots[skill] = current
        end
      end
    end
    
    app.stack do
      @starting_skill_values = app.para ''  
      @skills_xp_spent = app.para ''
    end
    
  end
  
  def set_starting_points(starting_points)
    @starting_skill_values.text = Strings.starting_skill_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @skills_xp_spent.text = Strings.skill_xp_spent(xp)
  end
  
end