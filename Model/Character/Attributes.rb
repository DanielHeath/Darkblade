require File.dirname(__FILE__) + "/../../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../../Config/Attributes.rb"

module Model;end

class Model::Attributes
  
  def initialize
    @vals = {}
    ATTRS.each do |attrib|
      # Initialize the attribute
      @vals[attrib] = 1
    end # Each attribute
  end # Initialize
  
  def [](attrib)
    @vals[attrib]
  end
  
  def []=(attrib, value)
    @vals[attrib] = value
  end
  
  def xp_cost
    ATTRS.collect do |attrib|
      ATTR_XP_COSTS[@vals[attrib]]
    end.sum
  end
  
  def valid_starting_attributes
    starting_point_costs.sort == ATTRS_STARTING_POINTS.sort
  end
  
  def starting_point_costs
    ATTRS_BY_TYPE.collect do |type|
      type.collect do |attrib|
        ATTRS_STARTING_POINT_COST[@vals[attrib]]
      end.sum
    end
  end
  
end # class Attributes
