require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/../Rules.rb"

module Model;end

class Model::Specializations < Array
  
  def is_specialized(skill, specialization)
    include? [skill, specialization]
  end
  
  def add_specialization(skill, specialization)
    push [skill, specialization]
  end
  
  def remove_specialization(skill, specialization)
    delete [skill, specialization]
  end
  
  def xp_cost
    length * SPECIALIZATION_COST
  end
  
end #class Specializations
