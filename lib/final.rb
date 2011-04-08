# Make your classes final. Why? Because we can.
module Final
  class Error < RuntimeError; end

  def self.included(mod)
    # Prevent subclassing, except implicity subclassing from Object.
    def mod.inherited(sub)
      raise Error, "cannot subclass #{self}" unless self == Object
    end

    # Freeze all instance methods and class methods.
    def mod.method_added(sym)
      if self.instance_methods.include?(sym) || self.instance_methods.include?(sym.to_s)
        raise Error, "instance method '#{sym}' already defined"
      end

      if self.methods.include?(sym) || self.methods.include?(sym.to_s)
        raise Error, "singleton method '#{sym}' already defined"
      end
    end
  end
end
