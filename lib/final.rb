# Make your classes final. Once final'ized, they cannot be subclassed and
# their methods cannot be redefined.
#
module Final
  # Error raised if any of the Final module's rules are violated.
  class Error < RuntimeError; end

  # The version of the final library.
  VERSION = '0.1.0'

  def self.included(mod)
    # Prevent subclassing, except implicity subclassing from Object.
    def mod.inherited(sub)
      raise Error, "cannot subclass #{self}" unless self == Object
    end

    # Prevent instance methods and singleton methods from being redefined. A little
    # extra work necessary because of differences between 1.8 and 1.9.
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
