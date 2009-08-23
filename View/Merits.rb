require File.dirname(__FILE__) + "/../Model/Character/Merits.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Model/Reference/Merits/Merits.rb"
require 'singleton'

module View;end

class View::Merits
  include Singleton
  
  def add_components(app)
    @app = app
    
    @app.flow do
      @app.caption "Merits"
    end
    
    @merits_dropdown = @app.list_box :items => Reference::Merit.merits.collect { |m| m.name }, :choose => Reference::Merit.merits.first.name
    
    @add_merits_button = @app.button "Add Merit" 
    
    app.stack do
      @starting_merit_values = app.para ''  
      @merits_xp_spent = app.para ''
    end
  end
  
  def update(character)
    @add_merits_button.click do
      add_merit_click(@app, character)
    end
    character.original_merits.each do |reference, dots|
      display_merit(character, reference, dots)
    end
    character.final_merits.each do |reference, dots|
      display_merit(character, reference, dots, :final)
    end
  end
  
  def set_starting_points(starting_points)
    @starting_merit_values.text = Strings.starting_merit_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @merits_xp_spent.text = Strings.merits_xp_spent(xp)
  end
  
  private
  
  def add_merit_click(app, character)
    #merits = character.merits
    #specialization = @new_specialization_edit.text
    #skill = @skill_list_box.text
    
    #if not specializations.is_specialized(skill, specialization) then
      #specializations.add_specialization(skill, specialization)
      #display_specialization(character, skill, specialization)
      #@app.character_changed
    #end
  end
  
  def display_merit(character, reference, dots, final=false)
    #remover = nil # Create local variable here so it stays in scope
    #@app.before(@add_specialization_button) do
      #@app.flow do
        #@app.para "Skilled at #{skill}, especially #{specialization}"
        #remover = @app.button "Remove specialization"
      #end
    #end
    #remover.click do
      #character.specializations.remove_specialization(skill, specialization)
      #remover.parent.remove()
    #end
  end
  
end