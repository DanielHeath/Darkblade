module Reference; end;

class Reference::Merit
  attr_reader :name, :type, :costs, :prereqs
  
  def self.merits
    if not @@merits then
      # Creates the list of merits on-demand
      load 'DSL.rb'
    end
    @@merits
  end
  
  def initialize(name, type, costs)
    @name, @type, @costs = name, type, costs
    @prereqs = []
    (@@merits ||= []).push self
  end
  
  def add_prerequisite(prereq)
    @prereqs.push prereq
  end
end
