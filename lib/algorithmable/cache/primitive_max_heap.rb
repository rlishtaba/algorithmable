module Algorithmable
  module Cache
    class PrimitiveMaxHeap
      extend Forwardable

      def_delegators :@index, :size, :empty?

      def initialize(index = [])
        @storage = {}
        @index = index
      end

      def pop
        key = @index.delete @index.last
        @storage.delete key
      end

      def []=(key, value)
        swim key
        @storage[key] = value
      end

      def [](key)
        @storage[key].tap do |value|
          swim key if value
        end
      end

      def swim(key)
        @index.delete(key)
        @index.unshift(key)
      end
    end
    private_constant :PrimitiveMaxHeap
  end
end
