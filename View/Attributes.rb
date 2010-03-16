class View::Attributes < View::Base
  include Singleton
  attr_reader :attribute_dots
  
  def add_caption(app)
    super
    @caption.text = "Attributes"
  end
  
  def add_components(app)
    super
    @labelled_dots = {}
    @content = @app.stack do
      @app.flow do
        ATTRS_BY_TYPE.each do |type|
          @app.stack :width => '33%' do
            type.each do |attrib|
              @labelled_dots[attrib] = @app.labelled_dots attrib, 1
            end
          end
        end
      end
      
      app.stack do
        @starting_attr_values = @app.para ''  
        @attrs_xp_spent = @app.para ''
      end
    end
  end
  
  def update(character)
    @labelled_dots.each do |attrib, ld|
      ld.dots.original_value = character.original_attrs[attrib] || 1
      ld.dots.final_value = character.final_attrs[attrib] || 1
      
      ld.dots.on_changed do |dots|
        character.original_attrs[attrib] = dots.original_value
        character.final_attrs[attrib] = dots.final_value
        @app.character_changed
      end # New onchanged event to use new character.
      
    end # each labelled_dots control
  end # update(character)
  
  def set_starting_points(starting_points)
    @starting_attr_values.text = Strings.starting_attribute_points(starting_points)
  end
  
  def set_xp_spent(xp)
    @attrs_xp_spent.text = Strings.attribute_xp_spent(xp)
  end
  
end
