module Algorithmable
  module DataStructs
    class Queue
      include Algorithmable::Errors
      include Enumerable

      def initialize(collection = [])
        @imp = Deque.new collection
      end

      def size
        @imp.size
      end

      def empty?
        @imp.empty?
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

      def each(&block)
        @imp.each(&block)
      end
    end
  end
end
