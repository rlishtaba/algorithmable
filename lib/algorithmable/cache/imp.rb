module Algorithmable
  module Cache
    class Imp
      extend Forwardable

      def_delegators :@heap, :size, :empty?, :[]

      def initialize(max_size = 1, heap = PrimitiveMaxHeap.new)
        @max_size = max_size
        @heap = heap
      end

      def []=(key, value)
        @heap.pop if @heap.size >= @max_size
        @heap[key] = value
      end
    end
  end
end
