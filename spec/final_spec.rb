########################################################################
# final_spec.rb
#
# Test suite for the final library.
########################################################################
require 'rspec'
require 'final'

RSpec.describe Final do
  let(:klass){
    Class.new do
      include Final
      def bar; end
    end
  }

  before do
    @foo = klass.new
  end

  example "version constant returns expected version number" do
    expect(Final::FINAL_VERSION).to eq('0.3.0')
    expect(Final::FINAL_VERSION).to be_frozen
  end

  example "final class cannot be subclassed" do
    expect{ class Bar < klass; end }.to raise_error(Final::Error)
  end

  example "final class cannot have instance methods redefined" do
    expect{ klass.define_method(:bar){ "bar" } }.to raise_error(Final::Error)
  end

  example "adding a new method is not an error" do
    expect{ klass.define_method(:foo){ "foo" } }.not_to raise_error
  end

  example "finalized classes do not interfere with each other" do
    expect{ class Foo2; include Final; def bar; end; end }.not_to raise_error
  end
end
