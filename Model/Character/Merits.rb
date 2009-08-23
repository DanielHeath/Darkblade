require File.dirname(__FILE__) + "/../../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Reference/Merits/DSL.rb"

module Model;end

class Model::Merits
  
  def initialize
    @vals = {}
    SKILLS.each do |skill|
      # Initialize the skill
      @vals[skill] = 0
    end # Each skill
  end # Initialize
  
  def each(&block)
    @vals.each {|k, v| block.call(k, v)}
  end
  
  def [](merit)
    @vals[ref_merit]
  end
  
  def []=(ref_merit, dots)
    @vals[ref_merit] = dots
  end
  
  def valid_starting_merits
    starting_point_cost == MERIT_STARTING_POINTS
  end
  
  def starting_point_cost
    @vals.values.sum {|dots| MERIT_STARTING_POINT_COST[dots]}
  end
  
  def xp_cost
    @vals.values.sum {|dots| MERIT_XP_COSTS[dots]}
  end
  
end #class Specializations
