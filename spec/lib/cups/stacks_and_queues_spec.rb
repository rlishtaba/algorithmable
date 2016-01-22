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

      expect(stack.empty? 0).to be_falsey
    end
  end

  context 'when testing Stack with min available' do
    it do
      stack = runtime.new_stack_with_min
      items = [2, 5, 4, 0, 6, 8, 4, 3]
      items.each { |i| stack.push i }
      expect(stack.min).to eq(items.min)
    end
  end

  context 'when testing 2 stacks queue' do
    let(:queue) { runtime.new_two_stacks_queue }
    let(:items) { [2, 5, 4, 0, 6, 8, 4, 3] }

    before do
      items.each { |i| queue.enqueue i }
    end

    it do
      item = queue.dequeue
      expect(item).to eq(items.first)
    end

    it do
      queue.dequeue
      expect(queue.peek).to eq(items[1])
    end

    it do
      queue.dequeue
      queue.enqueue 10
      item = queue.peek
      expect(item).to eq(items[1])
    end
  end

  context 'when sorting stack' do
    let(:stack) { Algorithmable::DataStructs::Stack.new }
    let(:items) { [2, 5, 4, 0, 6, 8, 4, 3] }

    before do
      items.each { |i| stack.push i }
    end

    it do
      sorted = runtime.sort_stack stack
      expect(sorted.to_a).to eq(items.sort)
    end
  end

  context 'when solving Towers of Hanoi puzzle' do
    let(:towers) do
      1.upto(3).each_with_object([]) do |index, object|
        object << runtime.new_tower_of_hanoi(index)
      end
    end

    it do
      disks = 4
      (disks).downto(1).each { |disk| towers[0].add disk }

      expect(towers[0].to_a).to eq([1, 2, 3, 4])
      towers[0].move_disks disks, towers[2], towers[1]
      expect(towers[2].to_a).to eq([1, 2, 3, 4])
    end
  end
end