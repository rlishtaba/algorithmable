module Algorithmable
  module DataStructs
    module LinkedList
      class Node
        attr_accessor :item, :next

        def initialize(item, pointer = nil)
          @item = item
          @next = pointer
        end
      end
    end
  end
end
