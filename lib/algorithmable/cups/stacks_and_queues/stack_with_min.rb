module Algorithmable
  module Cups
    module StacksAndQueues
      class StackWithMin < Algorithmable::DataStructs::Stack
        MAX_INT = 2**32
        NodeWithMin = Struct.new(:item, :minimum)

        private_constant :NodeWithMin

        def push(item)
          new_min = [item, min].min
          node = NodeWithMin.new item, new_min
          super node
        end

        def min
          return MAX_INT if empty?
          peek.min
        end
      end
    end
  end
end
