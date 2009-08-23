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
    
    @add_merit_button = @app.button "Add Merit" 
    
    @app.stack do
      @starting_merit_values = @app.para 'blue'
      @merits_xp_spent = @app.para 'blue'
    end
  end
  
  def update(character)
    # Get rid of existing stuff
    @displays.each { |d| d.remove} if @displays
    
    @add_merit_button.click do
      add_merit_click(@app, character) # Bind to the new character
    end
    
    merits = []
    character.original_merits.each { |reference, dots| merits.push reference }
    character.final_merits.each { |reference, dots| merits.push reference }
    merits.each { |m| display_merit(character, m) }
  end
  
  def set_starting_points(starting_points)
    @starting_merit_values.text = Strings.starting_merit_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @merits_xp_spent.text = Strings.merit_xp_spent(xp)
  end
  
  private
  
  def add_merit_click(app, character)
    display_merit(character, @merits_dropdown.text)
  end
  
  def display_merit(character, name)
    ref = Reference::Merit.find_by_name name
    @displays ||= {}
    if not @displays[name] then
      @app.after(@add_merit_button) do
        @displays[name] = @app.flow do
          add_merit_controls(character, ref)
        end # flow
      end # Before button
    end # if not assigned
  end # display_merit
  
  def add_merit_controls(character, ref)
    @app.para ref.name + ":"
    ndots = @app.ndots ref.costs.to_a.max, character.original_merits[ref.name], character.final_merits[ref.name], ref.costs
    ndots.on_changed do |dots|
      character.original_merits[ref] = dots.original_value
      character.final_merits[ref] = dots.final_value
      @app.character_changed
    end # On change for dots
  end # add_merit_controls
  
end