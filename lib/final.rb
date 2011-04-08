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

    # Prevent methods from being redefined.
    #--
    # FIXME: We don't want to raise an error on initial definition. Otherwise
    # people will have to do the include -after- all initial method definitions.
    #
    def mod.method_added(sym)
      if self.instance_methods.respond_to?(sym) ||
         self.instance_methods.respond_to(sym.to_s)
      then
        raise Error, "method '#{sym}' already defined"
      end
    end
  end
end
