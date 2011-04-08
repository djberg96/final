########################################################################
# test_final.rb
#
# Test suite for the final library.
########################################################################
require 'rubygems'
gem 'test-unit'
require 'test/unit'
require 'final'

class TC_Final < Test::Unit::TestCase
  class Foo
    include Final
    def bar; end
  end

  def setup
    @foo = Foo.new
  end

  test "version constant returns expected version number" do
    assert_equal('0.1.0', Final::VERSION)
  end

  test "final class cannot be subclassed" do
    assert_raise(Final::Error){ class Bar < Foo; end }
  end

  test "final class cannot have instance methods redefined" do
    assert_raise(Final::Error){ class Foo; def bar; end; end }
  end

  test "adding a new method is not an error" do
    assert_nothing_raised{ class Foo; def baz; end; end }
  end

  def teardown
    @foo = nil
  end
end
