require File.dirname(__FILE__) + "/../../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Reference/Merits/DSL.rb"

module Model;end

class Model::Merits
  
  def initialize
    @vals = {}
  end # Initialize
  
  def each(&block)
    @vals.each {|k, v| block.call(k, v)}
  end
  
  def [](name_or_ref)
    @vals[ref_merit(name_or_ref)] || 0
  end
  
  def []=(name_or_ref, dots)
    @vals[ref_merit(name_or_ref)] = dots
  end
  
  def valid_starting_merits
    starting_point_cost <= MERIT_STARTING_POINTS
  end
  
  def starting_point_cost
    @vals.values.sum {|dots| MERIT_STARTING_POINT_COST[dots]}
  end
  
  def xp_cost
    @vals.values.collect {|dots| MERIT_XP_COSTS[dots]}.sum
  end
  
  def remove(name_or_ref)
    @vals.delete ref_merit(name_or_ref)
  end
  
  
  private
  
  def ref_merit(name_or_ref)
    if name_or_ref.kind_of? Reference::Merit then
      name_or_ref
    else
      Reference::Merit.find_by_name(name_or_ref)
    end
  end
  
end #class Specializations
