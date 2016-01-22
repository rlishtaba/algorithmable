module Algorithmable
  module Cups
    module StacksAndQueues
      class StackSorter
        include Algorithmable::DataStructs

        def self.sort(stack)
          new.sort(stack)
        end

        def sort(stack)
          local_stack = new_lifo_queue
          until stack.empty?
            temp = stack.pop
            while !local_stack.empty? && local_stack.peek < temp
              stack.push local_stack.pop
            end
            local_stack.push temp
          end
          local_stack
        end
      end
    end
  end
end
