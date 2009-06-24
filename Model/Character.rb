require File.dirname(__FILE__) + "/Attributes.rb"
require File.dirname(__FILE__) + "/Skills.rb"

class Character
  attr_reader :original_attrs, :final_attrs, :original_skills, :final_skills
  attr_accessor :name
  
  def initialize
    @original_attrs = Attributes.new
    @final_attrs = Attributes.new
    @original_skills = Skills.new
    @final_skills = Skills.new
  end # initialize
  
  def skills_xp_cost
    @final_skills.xp_cost - @original_skills.xp_cost
  end
  
  def attrs_xp_cost
    @final_attrs.xp_cost - @original_attrs.xp_cost
  end
  
  def save(filename)
    if filename then
      File.open(filename, File::CREAT|File::TRUNC|File::WRONLY) do |f|
        Marshal.dump(self, f)
      end
    end
  end # save
  
  def Character.load(filename)
    result = nil
    if filename then
      File.open(filename, File::RDONLY) do |f|
        data = f.read
        result = Marshal.load(data)
      end
    end
    result
  end # load
  
end
