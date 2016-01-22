module Algorithmable
  module Cups
    module StacksAndQueues
      class TwoStacksQueue
        include Algorithmable::DataStructs

        def initialize
          @stack_a = new_lifo_queue
          @stack_b = new_lifo_queue
        end

        def size
          @stack_a.size + @stack_b.size
        end

        def enqueue(item)
          unless @stack_b.empty?
            @stack_a.push @stack_b.pop until @stack_b.empty?
          end
          @stack_a.push(item)
        end

        def dequeue
          return @stack_b.dequeue unless @stack_b.empty?
          @stack_b.push @stack_a.pop until @stack_a.empty?
          @stack_b.pop
        end

        def peek
          return @stack_b.peek unless @stack_b.empty?
          @stack_b.push @stack_a.pop until @stack_a.empty?
          @stack_b.peek
        end
      end
    end
  end
end
