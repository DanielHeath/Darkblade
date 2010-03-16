class View::Base
  
  def add_caption(app)
    @app = app
    
    @app.stack(:width => '25%') do
      @caption = app.caption("")
    end.click do |button, left, top|
      @app.set_tab self
    end
  end
  
  def add_components(app)
    @app = app
  end
  
  def hide
    # Sometimes @content gets assigned something else. 
    # No idea how, something is doing some wierdness.
    @content.hide()
    @caption.style :stroke => @app.black
  end
  
  def show
    @content.show
    @caption.style :stroke => @app.lightsalmon
  end
  
end
