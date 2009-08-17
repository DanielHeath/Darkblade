require 'Prerequisites.rb'
require 'Merits.rb'

module Reference; end;

def mental(merit, valid_costs, options = {})
  @last = @last_merit = Reference::Merit.new(merit, :mental, valid_costs, options[:specialized])
  @last_specialization = nil
end

def physical(merit, valid_costs, options = {})
  @last = @last_merit = Reference::Merit.new(merit, :physical, valid_costs, options[:specialized])
  @last_specialization = nil
end

def social(merit, valid_costs, options = {})
  @last = @last_merit = Reference::Merit.new(merit, :social, valid_costs, options[:specialized])
  @last_specialization = nil
end

def specialization(name)
  @last = @last_specialization = Reference::Specialization.new(name)
  @last_merit.default_specializations.push @last_specialization
end

def prerequisite_attribute(attr, value)
  @last.add_prerequisite Reference::AttributePrerequisite.new(attr, value)
end

def prerequisite_faction(faction)
  @last.add_prerequisite Reference::FactionPrerequisite.new(faction)
end

def prerequisite_skill(skill, value)
  @last.add_prerequisite Reference::SkillPrerequisite.new(skill, value)
end

def prerequisite_skill_specialization(skill, specialization)
  @last.add_prerequisite Reference::SkillSpecializationPrerequisite.new(skill, specialization)
end

def prerequisite_merit(merit, value=0)
  @last.add_prerequisite Reference::MeritPrerequisite.new(merit, value)
end

def prerequisite_one_of()
  llast = @last
  @last = Reference::OneOfPrerequisite.new()
  yield
  llast.add_prerequisite @last
  @last = llast
end

load File.dirname(__FILE__) + "/../Rules/Merits.rb"