class View::Merits < View::Base
  include Singleton
  
  caption_text "Merits"
  
  def add_components(app)
    super
    @content = @app.flow do
      @merits_dropdown = @app.list_box :items => Reference::Merit.merits.collect { |m| m.name }, :choose => Reference::Merit.merits.first.name
      @add_merit_button = @app.add_button
      
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
      add_merit(@app, character) # Bind click event to the new character
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
    items = available_merit_names(character)
    @merits_dropdown.items = items
  end
  
  def available_merit_names(character)
    Reference::Merit.merits.collect { |m| m.name } - character.names_of_merits
  end
  
  def add_merit(app, character)
    return if not @merits_dropdown.text
    ref = Reference::Merit.find_by_name @merits_dropdown.text
    # We have to call choose now, because after we change the items property it doesn't work properly until after a re-draw for some reason.
    @merits_dropdown.choose((available_merit_names(character) - [@merits_dropdown.text])[0])
    
    add_character_merit(character, ref)
    display_merit character, ref
    reset_merits_dropdown character
    @app.character_changed
  end
  
  def add_character_merit(character, ref)
    min_dots = ref.costs.to_a.min
    character.original_merits[ref] = min_dots
    # The following line means that the app will not by default over-spend on starting points.
    character.original_merits[ref] = 0 if not character.original_merits.valid_starting_merits
    character.final_merits[ref] = min_dots
  end
  
  def display_merit(character, ref)
    if not @displays[ref.name] then
      @displays[ref.name] = @app.flow do
        add_merit_controls(character, ref)
      end # flow
    end # if not assigned
  end # display_merit

  def add_merit_controls(character, ref)
    @app.flow do
      @app.remove_button do 
        character.original_merits.remove ref
        character.final_merits.remove ref
        @displays[ref.name].remove
        reset_merits_dropdown character
        @app.character_changed
      end
      
      @app.para ref.name + ":"
      ndots = @app.ndots ref.costs.to_a.max, character.original_merits[ref.name], character.final_merits[ref.name], ref.costs
      ndots.on_changed do |dots|
        character.original_merits[ref] = dots.original_value
        character.final_merits[ref] = dots.final_value
        @app.character_changed
      end # On change for dots
    end
  end # add_merit_controls
  
end
