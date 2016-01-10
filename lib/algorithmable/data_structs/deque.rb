module Algorithmable
  module DataStructs
    class Deque
      include Algorithmable::Errors

      Node = Struct.new(:prev, :next, :item)
      private_constant :Node

      attr_reader :size

      def initialize(collection = [])
        @front = nil
        @back = nil
        @size = 0
        collection.each { |item| push_back(item) }
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

      def push_front(obj)
        node = Node.new(nil, nil, obj)
        if @front
          node.next = @front
          @front.prev = node
          @front = node
        else
          @front = node
          @back = @front
        end
        @size += 1
        obj
      end

      def push_back(obj)
        node = Node.new(nil, nil, obj)
        if @back
          node.prev = @back
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
        fail NoSuchElementError unless @front
        node = @front
        if 1 == @size
          clear
          return node.item
        else
          @front.next.prev = nil
          @front = @front.next
        end
        @size -= 1
        node.item
      end

      def pop_back
        fail NoSuchElementError unless @back
        node = @back
        if @size == 1
          clear
          return node.item
        else
          @back.prev.next = nil
          @back = @back.prev
        end
        @size -= 1
        node.item
      end

      # represent fifo iterator
      def each(&block)
        collect_items(:forward).each(&block)
      end

      # represent lifo iterator
      def reverse_each(&block)
        collect_items(:backward).each(&block)
      end

      def to_a
        each.to_a
      end

      def map(&block)
        each.map(&block)
      end

      private

      def collect_items(order)
        variable = order == :backward ? @back : @front
        action = order == :backward ? :prev : :next
        items = []
        if variable
          node = variable
          while node
            items << node.item
            node = node.public_send action
          end
        end
        items
      end
    end
  end
end
