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

  describe 'get command' do
    describe 'pods' do
      it 'get pods' do
        subject.invoke(:get, ['pods'])
        expect(output.string).to eq("No resources found in default namespace\n")
      end

      describe 'with different namespace' do
        xit 'executes on the right namespace' do
          subject.invoke(:get, ['pods', '--namespace', 'something'])
          expect(output.string).to eq("No resources found in something namespace\n")
        end
      end
    end

    describe 'services' do
      it 'get services' do
        subject.invoke(:get, ['services'])
        expect(output.string).to eq("NAME\nkubernetes\n")
      end
    end

    describe 'deployments' do
      it 'get deployments' do
        subject.invoke(:get, ['deployments'])
        expect(output.string).to eq("No resources found in default namespace\n")
      end
    end
  end
end
