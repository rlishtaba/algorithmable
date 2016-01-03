module Algorithmable
  module DataStructs
    class Queue
      include Algorithmable::Errors
      include Enumerable
      extend Forwardable

      def_delegators :@imp, :empty?, :size, :each

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
    end
  end
end
