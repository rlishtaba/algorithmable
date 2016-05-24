module Algorithmable
  module Cache
    class PrimitiveMaxHeap
      include Algorithmable::Cache::Methods
      extend Forwardable

      def_delegators :@index, :size, :empty?
      def_delegators :@storage, :key?

      def initialize(index = [])
        @storage = {}
        @index = index
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

      private

      def swim(key)
        @index.delete(key)
        @index.unshift(key)
      end
    end
    private_constant :PrimitiveMaxHeap
  end
end
