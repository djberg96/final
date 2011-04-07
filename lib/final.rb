# final.rb
class Object
  class FinalError < RuntimeError; end

  # Prevent subclassing, except implicity subclassing from Object.
  def self.inherited(sub)
    raise FinalError, "cannot subclass #{self}" unless self == Object
  end

  def inherited(sub)
    raise FinalError, "cannot subclass #{self}" unless self == Object
  end

  # Freeze all instance methods and class methods.
  def self.method_added(sym)
    if self.instance_methods.include?(sym) || self.instance_methods.include?(sym.to_s)
      raise FinalError, "instance method '#{sym}' already defined"
    end

    if self.methods.include?(sym) || self.methods.include?(sym.to_s)
      raise FinalError, "singleton method '#{sym}' already defined"
    end
  end
end
