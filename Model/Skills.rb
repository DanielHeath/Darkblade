require File.dirname(__FILE__) + "/../Lib/Utils.rb"

SKILLS_STARTING_POINT_COST = [0, 1, 2, 3, 4, 6]

MENTAL_SKILLS =   [ :academics, 
                    :computer, 
                    :crafts, 
                    :investigation, 
                    :medicine, 
                    :occult, 
                    :politics, 
                    :science]
PHYSICAL_SKILLS = [ :athletics, 
                    :brawl, 
                    :drive,
                    :firearms,
                    :larceny,
                    :stealth,
                    :survival,
                    :weaponry]
SOCIAL_SKILLS =   [ :animal_ken, 
                    :empathy, 
                    :expression,
                    :intimidation,
                    :persuasion,
                    :socialize,
                    :streetwise,
                    :subterfuge]

SKILLS_BY_TYPE = [MENTAL_SKILLS, 
                  PHYSICAL_SKILLS, 
                  SOCIAL_SKILLS]

SKILLS = SKILLS_BY_TYPE.flatten

SKILL_XP_COSTS = [0, 3, 9, 18, 30, 45]

class Skills
  
  def initialize
    @vals = {}
    SKILLS.each do |skill|
    
      # Initialize the skill
      @vals[skill] = 0

      # Create skill reader
      create_method(skill) { @vals[skill] }
      
      # Create skill writer
      create_method(skill.to_s + '=') do |value|
        @vals[skill] = value.to_i
      end
      
      # Create XP cost reader
      create_method(skill.to_s + '_xp_cost') do
        SKILL_XP_COSTS[@vals[skill]]
      end
      
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
    starting_point_costs.sort == [11, 7, 3].sort
  end
  
  def starting_point_costs
    SKILLS_BY_TYPE.collect do |type|
      type.collect do |skill|
        SKILLS_STARTING_POINT_COST[@vals[skill]]
      end.sum
    end
  end
end # class Skills

