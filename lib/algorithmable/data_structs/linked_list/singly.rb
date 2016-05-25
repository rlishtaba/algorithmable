module Algorithmable
  module DataStructs
    module LinkedList
      class Singly < Base

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

        def merge(other)
          front = recursive_merge_imp self.front, other.front
          list = self.class.new
          while front
            list.push_back front.item
            front = front.next
          end
          list
        end

        def reverse!
          @back = @front
          @front = reverse_imp @front
          self
        end

        def sort!
          sort_linked_list @front
        end

        private

        def sort_linked_list(node)
          return unless node || node.empty?
          swapped = false
          prev = nil

          begin
            swapped = false
            current = node

            until current.next == prev
              if current.item > current.next.item
                swap_nodes current, current.next
                swapped = true
              end
              current = current.next
            end

            prev = current
          end while swapped
        end

        def swap_nodes(node1, node2)
          tmp = node1.item
          node1.item = node2.item
          node2.item = tmp
        end

        def recursive_merge_imp(node1, node2)
          return node2 if node1.nil?
          return node1 if node2.nil?
          node1 = node1.dup
          node2 = node2.dup
          if node1.item < node2.item
            node1.next = recursive_merge_imp(node1.next, node2)
            node1
          else
            node2.next = recursive_merge_imp(node2.next, node1)
            node2
          end
        end

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

        class Node
          attr_accessor :item, :next, :front

          def initialize(item, next_pointer = nil)
            @item = item
            @next = next_pointer
          end
        end

        private_constant :Node
      end
    end
  end
end
