require File.dirname(__FILE__) + "/../Lib/Utils.rb"
require File.dirname(__FILE__) + "/Rules/Skills.rb"

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
  
  def [](skill)
    select {|e| e[0] == skill}.collect {|e| e[1]}
  end
  
  def each(&block)
    if block and block.arity == 2 then
      each do |e|
        block.call(e[0], e[1])
      end
    else
      super
    end
  end
  
end #class Specializations
