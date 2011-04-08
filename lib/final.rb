# Make your class final. Once final'ized, it cannot be subclassed and
# its methods cannot be redefined.
#
module Final
  # Error raised if any of the Final module's rules are violated.
  class Error < RuntimeError; end

  # The version of the final library.
  VERSION = '0.1.0'

  # Stores methods as they're defined. Once defined, they cannot be redefined.
  @final_methods = []

  # Accessor for the
  def self.final_methods
    @final_methods
  end

  def self.included(mod)
    # Prevent subclassing, except implicity subclassing from Object.
    def mod.inherited(sub)
      raise Error, "cannot subclass #{self}" unless self == Object
    end

    # Prevent methods from being redefined.
    def mod.method_added(sym)
      if Final.final_methods.include?(sym)
        raise Error, "method '#{sym}' already defined"
      else
        Final.final_methods << sym
      end
    end
  end
end
