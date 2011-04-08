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

  def teardown
    @foo = nil
  end
end
