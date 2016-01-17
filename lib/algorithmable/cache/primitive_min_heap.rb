module Algorithmable
  module Cache
    class PrimitiveMinHeap
      extend Forwardable

      def_delegators :@index, :size, :empty?

      def initialize
        @storage = {}
        @index = []
      end

      def pop
        key = @index.delete @index.last
        @storage.delete key
      end

      def []=(key, value)
        sink key
        @storage[key] = value
      end

      def [](key)
        @storage[key].tap do |value|
          sink key if value
        end
      end

      def sink(key)
        @index.delete(key)
        @index.push(key)
      end
    end
    private_constant :PrimitiveMinHeap
  end
end
