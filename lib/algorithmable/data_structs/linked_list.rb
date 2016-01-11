module Algorithmable
  module DataStructs
    class LinkedList
      attr_reader :size
      def initialize(collection = [])
        @front = nil
        @back = nil
        @size = 0
        collection.each { |item| push_front item }
      end

      def empty?
        0 == size
      end

      def clear
        @front = nil
        @back = nil
        @size = 0
      end

      def peek_front
        @front && @front.item
      end

      def peek_back
        @back && @back.item
      end

      def key?(obj)
        each.map(&:item).include? obj
      end

      def pop_front
        return unless @front
        node = @front
        if 1 == @size
          clear
          return node.item
        else
          @front = @front.next
        end
        @size -= 1
        node.item
      end

      def push_front(obj)
        node = Node.new(obj)
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
        node = Node.new(obj)
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

      def pop_back
        return unless @back
        node = @back

        if 1 == @size
          clear
          return node.item
        else
          current = @front
          current = current.next until current.next.next.nil?
          current.next = nil
          @back = current
        end

        @size -= 1
        node.item
      end

      def delete(item)
        tmp_node = @front
        prev_node = nil

        until tmp_node.nil?
          if tmp_node.item == item
            if tmp_node == @front
              unlink_head_node
            else
              unlink_node prev_node, tmp_node
            end
            return true
          else
            prev_node = tmp_node
          end

          tmp_node = tmp_node.next
        end
      end

      private

      def unlink_head_node
        next_node = @front.next
        @back = next_node if @front == @back
        @front = next_node
        @size -= 1
      end

      def unlink_node(prev_node, node)
        prev_node.next = node.next
        @back = prev_node if node == @back
        @size -= 1
      end

      def each(&block)
        nodes = []
        node = @front
        until node.nil?
          nodes << node
          node = node.next
        end
        nodes.each(&block)
      end

      class Node
        attr_accessor :item, :next

        def initialize(item, pointer = nil)
          @item = item
          @next = pointer
        end
      end
      private_constant :Node
    end
  end
end
