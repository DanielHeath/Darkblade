require File.dirname(__FILE__) + "/../../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../../Config/Skills.rb"

module Model;end

class Model::Skills
  
  def initialize
    @vals = {}
    SKILLS.each do |skill|
      # Initialize the skill
      @vals[skill] = 0
    end # Each skill
  end # Initialize
  
  def [](skill)
    @vals[skill]
  end
  
  def []=(skill, value)
    @vals[skill] = value
  end
  
  def xp_cost
    SKILLS.collect do |skill|
      SKILL_XP_COSTS[@vals[skill]]
    end.sum
  end
  
  def valid_starting_skills
    starting_point_costs.sort == SKILL_STARTING_POINTS.sort
  end
  
  def starting_point_costs
    SKILLS_BY_TYPE.collect do |type|
      type.collect do |skill|
        SKILLS_STARTING_POINT_COST[@vals[skill]]
      end.sum
    end
  end
end # class Skills

