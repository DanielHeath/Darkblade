# This file contains UI strings, which you can customize.
require File.dirname(__FILE__) + "/Config/Costs.rb"

module Strings

  def Strings.starting_attribute_points(starting_points)
    "Starting attribute points spent are #{starting_points}. You may use #{ATTRS_STARTING_POINTS} in any order."
  end
  
  def Strings.attribute_xp_spent(xp)
    "So far, this character has spent #{xp} xp on attributes."
  end

  def Strings.starting_skill_points(starting_points)
    "Starting skill points spent are #{starting_points}. You may use #{SKILL_STARTING_POINTS} in any order."
  end
  
  def Strings.skill_xp_spent(xp)
    "So far, this character has spent #{xp} xp on skills."
  end
  
  def Strings.specializations_xp_spent(xp)
    "So far, this character has spent #{xp} xp on skill specializations."
  end

  def Strings.starting_merit_points(starting_points)
    "Starting merit points spent are #{starting_points}. You may use #{MERIT_STARTING_POINTS}."
  end
  
  def Strings.merit_xp_spent(xp)
    "So far, this character has spent #{xp} xp on merits."
  end
  
end