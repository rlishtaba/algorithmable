module Algorithmable
  module DataStructs
    class Queue
      include Algorithmable::Errors
      extend Forwardable

      def_delegators :@imp, :empty?, :size, :each, :map, :to_a

      def initialize(collection = [])
        @imp = Deque.new collection
      end

      def peek
        peek_value = @imp.peek_front
        fail NoSuchElementError unless peek_value
        peek_value
      end

      def enqueue(item)
        @imp.push_back(item)
      end

      def dequeue
        @imp.pop_front
      end

      def to_s
        to_a.join('->')
      end
    end
  end
end
