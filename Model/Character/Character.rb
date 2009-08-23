require 'yaml'
require File.dirname(__FILE__) + "/Attributes.rb"
require File.dirname(__FILE__) + "/Skills.rb"
require File.dirname(__FILE__) + "/Specializations.rb"
require File.dirname(__FILE__) + "/Merits.rb"

module Model

  class Character
    attr_reader :original_attrs, :final_attrs, :original_skills, :final_skills, :specializations, :original_merits, :final_merits
    attr_accessor :name
    
    def initialize
      @original_attrs = Attributes.new
      @final_attrs = Attributes.new
      @original_skills = Skills.new
      @final_skills = Skills.new
      @specializations = Specializations.new
      @original_merits = Merits.new
      @final_merits = Merits.new
    end # initialize
    
    def attrs_xp_cost
      @final_attrs.xp_cost - @original_attrs.xp_cost
    end
    
    def skills_xp_cost
      @final_skills.xp_cost - @original_skills.xp_cost
    end
    
    def specializations_xp_cost
      @specializations.xp_cost
    end
    
    def merits_xp_cost
      @final_merits.xp_cost - @original_merits.xp_cost
    end
    
    def save(filename)
      if filename then
        File.open(filename, File::CREAT|File::TRUNC|File::WRONLY) { |f| f.puts self.to_yaml }
      end
    end # save
    
    def Character.load(filename)
      result = nil
      if filename and (filename != '') then
        result = YAML::load(File.open(filename, File::RDONLY))
      end
      result
    end # load
    
  end
end