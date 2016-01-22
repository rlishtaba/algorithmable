module Algorithmable
  module Cups
    module StacksAndQueues
      autoload :TwoStacksQueue, 'algorithmable/cups/stacks_and_queues/two_stacks_queue'
      autoload :StackWithMin, 'algorithmable/cups/stacks_and_queues/stack_with_min'
      autoload :TripleStack, 'algorithmable/cups/stacks_and_queues/triple_stack'
      autoload :StackSorter, 'algorithmable/cups/stacks_and_queues/stack_sorter'
      autoload :TowersOfHanoi, 'algorithmable/cups/stacks_and_queues/towers_of_hanoi'

      def new_triple_stack(size)
        TripleStack.new size
      end

      def new_stack_with_min
        StackWithMin.new
      end

      def new_two_stacks_queue
        TwoStacksQueue.new
      end

      def sort_stack(stack)
        StackSorter.sort stack
      end

      def new_tower_of_hanoi(index)
        TowersOfHanoi::Tower.new index
      end
    end
  end
end
