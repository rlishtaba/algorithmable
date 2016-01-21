module Algorithmable
  module Cups
    module StacksAndQueues
      def new_triple_stack(size)
        TripleStack.new size
      end

      class TripleStack
        MAX_INT = 2**32

        def initialize(size)
          @size = size + 1
          @pointers = [0, 0, 0]
          @array = Array.new (@size * 3)
          0.upto(2).each do |index|
            @array[@size * index] = MAX_INT
          end
        end

        def push(stack_num, item)
          pointer = get_stack_pointer(stack_num) + 1
          @pointers[stack_num] += 1
          @array[pointer] = item
          item
        end

        def pop(stack_num)
          pointer = get_stack_pointer(stack_num)
          value = @array[pointer]
          @array[pointer] = nil
          @pointers[stack_num] -= 1
          value
        end

        def peek(stack_num)
          pointer = get_stack_pointer(stack_num)
          @array[pointer]
        end

        def empty?(stack_num)
          @pointers[stack_num].zero?
        end

        def inspect
          "#<Stack @pointers=#{@pointers} @stacks=#{@array}>"
        end

        private

        def get_stack_pointer(stack_num)
          @size * stack_num + @pointers[stack_num]
        end
      end
      private_constant :TripleStack
    end
  end
end
