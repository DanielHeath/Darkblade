require File.dirname(__FILE__) + "/../../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Reference/DSL.rb"

module Model;end

class Model::Merits
  
  def initialize
    @vals = {}
    SKILLS.each do |skill|
      # Initialize the skill
      @vals[skill] = 0
    end # Each skill
  end # Initialize
  
  def [](merit)
    raise 'not implemented 1'
  end
  
  def []=(merit, dots)
    raise 'not implemented 2'
  end
  
  def valid_starting_merits
    raise 'not implemented 3'
  end
  
  def starting_point_cost
    raise 'not implemented 4'
  end
  
  def xp_cost
    raise 'not implemented 5'
  end
  
end #class Specializations
