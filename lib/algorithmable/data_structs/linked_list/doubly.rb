module Algorithmable
  module DataStructs
    module LinkedList
      class Doubly < Base
        class Node
          attr_accessor :item, :prev, :next

          def initialize(item, prev_pointer = nil, next_pointer = nil)
            @item = item
            @prev = prev_pointer
            @next = next_pointer
          end
        end

        private_constant :Node

        def push_front(item)
          prev_front = @front
          node = new_node item
        end

        private

        def new_node(item, prev_pointer = nil, next_pinter = nil)
          Node.new item, prev_pointer, next_pinter
        end
      end
    end
  end
end
