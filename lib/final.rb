# frozen_string_literal: true

# Make your class final. Once final'ized, it cannot be subclassed and
# its methods cannot be redefined.
#
module Final
  # Error raised if any of the Final module's rules are violated.
  class Error < RuntimeError; end

  # The version of the final library.
  FINAL_VERSION = '0.3.1'

  def self.included(mod)
    mod.instance_eval do
      # Store already defined methods.
      def final_methods
        @final_methods ||= []
      end

      # Prevent subclassing, except implicity subclassing from Object.
      def inherited(_sub)
        raise Error, "cannot subclass #{self}" unless self == Object
      end

      # Prevent methods from being redefined.
      #--
      # There's still going to be a method redefinition warning. Gosh, it
      # sure would be nice if we could disable warnings.
      #
      def method_added(sym)
        if final_methods.include?(sym)
          raise Error, "method '#{sym}' already defined"
        else
          final_methods << sym
        end
      end
    end
  end
end
