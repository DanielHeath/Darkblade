require File.dirname(__FILE__) + "/Prerequisites.rb"
require File.dirname(__FILE__) + "/Merits.rb"

module Reference; end;

module Reference::DSL
  
  def self.new_merit(merit, type, valid_costs, options = {})    
    @last = Reference::Merit.new(merit, type, valid_costs, options[:specialized])
  end

  def self.mental(merit, valid_costs, options = {})
    new_merit merit, :mental, valid_costs, options
  end

  def self.physical(merit, valid_costs, options = {})
    new_merit merit, :physical, valid_costs, options
  end

  def self.social(merit, valid_costs, options = {})
    new_merit merit, :social, valid_costs, options
  end

  def self.prerequisite_attribute(attr, value)
    @last.add_prerequisite Reference::AttributePrerequisite.new(attr, value)
  end

  def self.prerequisite_faction(faction)
    @last.add_prerequisite Reference::FactionPrerequisite.new(faction)
  end

  def self.prerequisite_skill(skill, value)
    @last.add_prerequisite Reference::SkillPrerequisite.new(skill, value)
  end

  def self.prerequisite_skill_specialization(skill, specialization)
    @last.add_prerequisite Reference::SkillSpecializationPrerequisite.new(skill, specialization)
  end

  def self.prerequisite_merit(merit, value=0)
    @last.add_prerequisite Reference::MeritPrerequisite.new(merit, value)
  end

  def self.prerequisite_one_of()
    llast = @last
    @last = Reference::OneOfPrerequisite.new()
    yield
    llast.add_prerequisite @last
    @last = llast
  end
  self.class_eval File.read(MERITS_CONFIG)
end

