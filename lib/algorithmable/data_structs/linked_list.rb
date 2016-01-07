module Algorithmable
  module DataStructs
    class LinkedList
      include Enumerable
      attr_reader :length

      def initialize
        @head = nil
        @tail = nil
        @length = 0
        @op_counter = 0
      end

      def unshift(data)
        link_head_node data
      end

      def push(data)
        link_tail_node data
      end

      def first
        @head ? @head.dup : fail_index_error
      end

      def last
        @tail ? @tail.dup : fail_index_error
      end

      def each(&block)
        next_node = @head
        nodes = []
        while next_node
          nodes << next_node
          next_node = next_node.succ
        end
        nodes.each(&block)
      end

      private

      def link_head_node(data)
        prev_head = @head
        node = make_node data, nil, prev_head
        @head = node

        if prev_head
          prev_head.pred = node
        else
          @tail = node
        end

        bump_length!
        bump_op_counter!
      end

      def link_tail_node(data)
        prev_tail = @tail
        node = make_node data, prev_tail, nil
        @tail = node

        if prev_tail
          prev_tail.succ = node
        else
          @head = node
        end

        bump_length!
        bump_op_counter!
      end

      def make_node(data, pred = nil, succ = nil)
        Node.new data, pred, succ
      end

      def bump_length!
        @length = @length.next
      end

      def bump_op_counter!
        @op_counter = @op_counter.next
      end

      def fail_index_error(message = nil)
        fail IndexError, message
      end

      class Node
        attr_accessor :pred, :succ
        attr_reader :data

        def initialize(data, pred = nil, succ = nil)
          @data = data
          @pred = pred
          @succ = succ
        end
      end
    end
  end
end
