module Algorithmable
  module DataStructs
    module LinkedList
      class Doubly < Base
        class Node
          attr_accessor :item, :prev, :next, :front

          def initialize(item, prev_pointer = nil, next_pointer = nil)
            @item = item
            @prev = prev_pointer
            @next = next_pointer
          end
        end

        private_constant :Node

        def push_front(item)
          prev_front = @front
          node = new_node item, nil, prev_front
          @front = node

          if prev_front
            prev_front.prev = node
          else
            @back = node
          end

          @size += 1
          item
        end

        def push_back(item)
          prev_back = @back
          node = Node.new item, prev_back, nil
          @back = node

          if prev_back
            prev_back.next = node
          else
            @front = node
          end

          @size += 1
          item
        end

        def pop_front
          delete peek_front
        end

        def pop_back
          delete peek_back
        end

        def delete(item)
          node = search(item)
          return unless node

          prev_node = node.prev
          next_node = node.next

          if prev_node.nil?
            @front = next_node
          else
            prev_node.next = next_node
          end

          if next_node.nil?
            @back = prev_node
          else
            next_node.prev = prev_node
          end

          @size -= 1
          item
        end

        private

        def new_node(item, prev_pointer = nil, next_pinter = nil)
          Node.new item, prev_pointer, next_pinter
        end
      end
    end
  end
end
