module Algorithmable
  module DataStructs
    class Stack
      include Algorithmable::Errors
      extend Forwardable

      def_delegators :@imp, :empty?, :size, :each, :map, :to_a

      def initialize(collection = [])
        @imp = Deque.new
        collection.each { |item| @imp.push_front item }
      end

      def peek
        peek_value = @imp.peek_front
        fail NoSuchElementError unless peek_value
        peek_value
      end

      def push(item)
        @imp.push_front(item)
      end

      def pop
        @imp.pop_front
      end
    end
  end
end
