module Reference; end;

class Reference::Merit
  attr_reader :name, :type, :costs, :prereqs, :specialized
  
  # We only want to sort the list once.
  @@merits_sorted = false
  
  def self.merits
    load_merits
    sort_merits
    @@merits
  end
  
  def self.find_by_name(name)
    @@merits.detect {|m| m.name == name}
  end
  
  def initialize(name, type, costs, specialized)
    @name, @type, @costs, @specialized = name, type, costs, specialized
    @prereqs = []
    (@@merits ||= []).push self
  end
  
  def add_prerequisite(prereq)
    @prereqs.push prereq
  end
  
  private
  
  def self.load_merits
    if not @@merits then
      # Creates the list of merits on-demand
      load 'DSL.rb'
    end
  end
  
  def self.sort_merits
    if not @@merits_sorted then
      # Lets put all the ones ending in a number on the end.
      # Makes it a little easier on the eyes.
      @@merits_sorted = true
      extras = @@merits.select {|m| m.name[-1, 1].to_i > 0 }
      @@merits = @@merits - extras
      @@merits = @@merits + extras
    end
  end
  
end
