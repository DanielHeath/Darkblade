module Reference; end;

class Reference::Merit
  attr_reader :name, :type, :costs, :default_specializations
  
  def self.merits
    @@merits || []
  end
  
  def initialize(name, type, costs, specialization_allowed = false)
    @name, @type, @costs, @specialization_allowed = name, type, costs, (specialization_allowed || false)
    @prereqs = []
    @default_specializations = [] if specialization_allowed?
    (@@merits ||= []).push self
  end
  
  def specialization_allowed?
    @specialization_allowed
  end
  
  def add_prerequisite(prereq)
    @prereqs.push prereq
  end
end

class Reference::Specialization
  attr_reader :name
  
  def initialize(name)
    @name = name
    @prereqs = []
  end
  
  def add_prerequisite(prereq)
    @prereqs.push prereq
  end
end
