require File.dirname(__FILE__) + "/../Lib/Utils.rb"

ATTRS_STARTING_POINT_COST = [0, 0, 1, 2, 3, 5]

MENTAL_ATTRS = [:intelligence, :wits, :resolve]
PHYSICAL_ATTRS = [:strength, :dexterity, :stamina]
SOCIAL_ATTRS = [:presence, :manipulation, :composure]

ATTRS_BY_TYPE = [ MENTAL_ATTRS, 
                  PHYSICAL_ATTRS, 
                  SOCIAL_ATTRS]

ATTRS = ATTRS_BY_TYPE.flatten

ATTR_XP_COSTS = [0, 5, 15, 30, 50, 75]

class Attributes
  
  def initialize
    @vals = {}
    ATTRS.each do |attrib|
    
      # Initialize the attribute
      @vals[attrib] = 1

      # Create attribute reader
      create_method(attrib) { @vals[attrib] }
      
      # Create attribute writer
      create_method(attrib.to_s + '=') do |value|
        @vals[attrib] = value.to_i
      end
      
      # Create XP cost reader
      create_method(attrib.to_s + '_xp_cost') do
        ATTR_XP_COSTS[@vals[attrib]]
      end
      
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
    starting_point_costs.sort == [5, 4, 3].sort
  end
  
  def starting_point_costs
    ATTRS_BY_TYPE.collect do |type|
      type.collect do |attrib|
        ATTRS_STARTING_POINT_COST[@vals[attrib]]
      end.sum
    end
  end
  
end # class Attributes

