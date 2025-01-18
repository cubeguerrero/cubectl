require 'spec_helper'
require 'cubectl/cli'
require 'stringio'

RSpec.describe Cubectl::CLI do
  let(:output) { StringIO.new }

  before { $stdout = output }
  after { $stdout = STDOUT }

  describe 'hello command' do
    it 'greets the user' do
      subject.invoke(:hello, ['Cube'])
      expect(output.string).to eq("Hello, Cube!\n")
    end
  end
end
