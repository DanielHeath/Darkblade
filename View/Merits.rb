require File.dirname(__FILE__) + "/../Model/Character/Merits.rb"
require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Model/Reference/Merits/Merits.rb"
require File.dirname(__FILE__) + "/Base.rb"
require 'singleton'

module View;end

class View::Merits < View::Base
  include Singleton
  
  def add_caption(app)
    super
    @caption.text = "Merits"
  end
  
  def add_components(app)
    super
    @content = @app.flow(:height => 100) do
      @new_container = @app.flow do
        @merits_dropdown = @app.list_box :items => Reference::Merit.merits.collect { |m| m.name }, :choose => Reference::Merit.merits.first.name
        @add_merit_button = @app.button "Add Merit" 
      end
      
      @app.stack do
        @starting_merit_values = @app.para 'blue'
        @merits_xp_spent = @app.para 'blue'
      end
    end
  end
  
  def update(character)
    # Get rid of existing stuff
    @displays.each { |d| d.remove} if @displays
    
    @add_merit_button.click do
      add_merit(@app, character) # Bind to the new character
    end
    
    merits = []
    character.original_merits.each { |reference, dots| merits.push reference }
    character.final_merits.each { |reference, dots| merits.push reference }
    merits.each { |m| display_merit(character, m) }
    reset_merits_dropdown character
  end
  
  def set_starting_points(starting_points)
    @starting_merit_values.text = Strings.starting_merit_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @merits_xp_spent.text = Strings.merit_xp_spent(xp)
  end
  
  def hide
    super
    @displays.values.each {|f| f.hide}
  end
  
  def show
    super
    @displays.values.each {|f| f.show}
  end
  
  protected
  
  def initialize
    @displays = {}
  end
  
  private
  
  def reset_merits_dropdown(character)
    reference_merit_names = Reference::Merit.merits.collect { |m| m.name } 
    items = reference_merit_names - character.names_of_merits
    choose = items[0]
    @merits_dropdown.items = items
    @merits_dropdown.choose = items[0]
  end
  
  def add_merit(app, character)
    ref = Reference::Merit.find_by_name @merits_dropdown.text
    min_dots = ref.costs.to_a.min
    character.original_merits[ref] = min_dots
    # The following line means that the app will not by default over-spend on starting points.
    character.original_merits[ref] = 0 if not character.original_merits.valid_starting_merits
    character.final_merits[ref] = min_dots
    display_merit(character, ref)
    reset_merits_dropdown character
    @app.character_changed
  end
  
  def display_merit(character, ref)
    if not @displays[ref.name] then
      @app.before(@new_container) do
        @displays[ref.name] = @app.flow do
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