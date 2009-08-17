require 'Merits.rb'
module Reference; end;

class Reference::Prerequisite
  attr_reader :name, :value
  
  def initialize(name, value = nil)
    @name, @value = name, value
  end
  
  def initial_meets_prereq(character)
    initial(character)[@name] >= value
  end
  
  def final_meets_prereq(character)
    final(character)[@name] >= value
  end
  
end

class Reference::AttributePrerequisite < Reference::Prerequisite 
  def initial(character)
    character.original_attrs
  end
  def final(character)
    character.final_attrs
  end
end

class Reference::FactionPrerequisite < Reference::Prerequisite
  def initial(character)
    nil
  end
  def final(character)
    nil
  end
end

class Reference::SkillPrerequisite < Reference::Prerequisite
  def initial(character)
    character.original_skills
  end
  def final(character)
    character.final_skills
  end
end

class Reference::SkillSpecializationPrerequisite < Reference::Prerequisite
  def initial(character)
    nil
  end
  def final(character)
    character.specializations
  end
end

class Reference::MeritPrerequisite < Reference::Prerequisite
  def initial(character)
    nil
  end
  def final(character)
    nil
  end
end

class Reference::OneOfPrerequisite < Reference::Prerequisite
  attr_reader :prereqs
  def initialize(*args)
    @prereqs = args.to_a
  end
  
  def add_prerequisite(prereq)
    @prereqs.push prereq
  end
end