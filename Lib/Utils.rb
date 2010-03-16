class Class
    # Get a metaclass for this class
  def self.metaclass; class << self; self; end; end
end

class Array
  def sum
    fold(0) {|v, e| v.to_i + e.to_i}
  end
  
  def fold(value)
    each do |e|
      value = yield(value, e)
    end
    value
  end
end

class Object
  def create_method(name, &block)
   self.class.send(:define_method, name, &block)
  end
end

class Numeric
  def to_a
    [self]
  end
end
