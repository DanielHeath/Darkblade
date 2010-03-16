require File.dirname(__FILE__) + "/Prerequisites.rb"
require File.dirname(__FILE__) + "/Merits.rb"

module Reference; end;

module Reference::DSL
  
  def self.new_merit(merit, type, valid_costs, options = {})
    # If the last merit was declared as specialized, make 10 copies.
    # to support specializing multiple times. 
    # Ugly, but I don't want to waste UI space for the 3 merits that use it.
    if @last and @last_specialized then
      (1..9).each do |i|
        new = Reference::Merit.new(@last.name.to_s + i.to_s, @last.type, @last.costs)
        @last.prereqs.each do |p|
          new.add_prerequisite p
        end # each prereq
      end # 1 to 9
    end # If the previous merit was specialized
    
    @last = Reference::Merit.new(merit, type, valid_costs)
    @last_specialized = options[:specialized]
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

