require File.dirname(__FILE__) + "/../Model/Specializations.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Rules.rb"
require 'singleton'

module View;end

class View::Specializations
  include Singleton
  
  def add_components(app)
    @app = app
    
    app.flow do
      app.caption "Specializations"
    end
    @add_specialization_button = app.button "Add Skill Specialization" 
    
    @new_specialization_edit = app.edit_line
    @new_specialization_edit.text = "Name of specialization"
    @skill_list_box = app.list_box :items => SKILLS, :choose => SKILLS[0]
    
    app.stack do
      @specializations_xp_spent = app.para ''
    end
  end
  
  def update(character)
    @add_specialization_button.click do
      add_specialization_click(@app, character)
    end
    character.specializations.each do |skill, specialization|
      display_specialization(character, skill, specialization)
    end
  end
  
  def set_xp_spent(xp)
    @specializations_xp_spent.text = Strings.specializations_xp_spent(xp)
  end
  
  private
  
  def add_specialization_click(app, character)
    specializations = character.specializations
    specialization = @new_specialization_edit.text
    skill = @skill_list_box.text
    
    if not specializations.is_specialized(skill, specialization) then
      specializations.add_specialization(skill, specialization)
      display_specialization(character, skill, specialization)
      @app.character_changed
    end
  end
  
  def display_specialization(character, skill, specialization)
    remover = nil # Create local variable here so it stays in scope
    @app.before(@add_specialization_button) do
      @app.flow do
        @app.para "Skilled at #{skill}, especially #{specialization}"
        remover = @app.button "Remove specialization"
      end
    end
    remover.click do
      character.specializations.remove_specialization(skill, specialization)
      remover.parent.remove()
    end
  end
  
end