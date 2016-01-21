require 'spec_helper'

describe Algorithmable::Cups::StacksAndQueues do
  let(:runtime) { Object.new.extend(Algorithmable::Cups::StacksAndQueues) }
  context 'when testing stacks' do
    it do
      stack = runtime.new_triple_stack(3)
      stack.push 0, 1
      stack.push 0, 2
      stack.push 0, 3

      stack.push 1, 1
      stack.push 1, 2
      stack.push 1, 3

      stack.push 2, 1
      stack.push 2, 2
      stack.push 2, 3
      stack.pop 2

      puts stack.inspect
    end
  end
end