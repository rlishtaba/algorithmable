module Algorithmable
  module DataStructs
    module LinkedList
      class Singly < Base
        class Node
          attr_accessor :item, :next

          def initialize(item, next_pointer = nil)
            @item = item
            @next = next_pointer
          end
        end

        private_constant :Node

        def push_front(obj)
          node = new_node(obj)
          if @front
            node.next = @front
            @front = node
          else
            @front = node
            @back = @front
          end
          @size += 1
          obj
        end

        def push_back(obj)
          node = new_node(obj)
          if @back
            @back.next = node
            @back = node
          else
            @front = node
            @back = @front
          end
          @size += 1
          obj
        end

        def pop_front
          return unless @front
          node = @front

          if @front == @back
            clear!
          else
            @front = @front.next
            @size -= 1
          end

          node.item
        end

        def pop_back
          return unless @back
          node = @back
          if @front == @back
            clear!
          else
            prev = @front
            prev = prev.next while prev.next != @back
            @back = prev
            @back.next = nil
            @size -= 1
          end
          node.item
        end

        def delete(item)
          tmp_node = @front
          prev_node = nil

          until tmp_node.nil?
            if tmp_node.item == item
              if tmp_node == @front
                next_node = @front.next
                @back = next_node if @front == @back
                @front = next_node
                @size -= 1
              else
                prev_node.next = tmp_node.next
                @back = prev_node if tmp_node == @back
                @size -= 1
              end
              return true
            else
              prev_node = tmp_node
            end

            tmp_node = tmp_node.next
          end
        end

        private

        def reverse_imp(root)
          return root if root.nil? || root.next.nil?
          node = reverse_imp(root.next)
          root.next.next = root
          root.next = nil
          node
        end

        def remove_next(prev)
          if prev.nil?
            pop_front
          elsif prev.next == @back
            @back = prev
            @back.next = nil
            @size -= 1
          elsif prev == @back
            return
          else
            prev.next = prev.next.next
            @size -= 1
          end
        end

        def new_node(item, next_pinter = nil)
          Node.new item, next_pinter
        end
      end
    end
  end
end
