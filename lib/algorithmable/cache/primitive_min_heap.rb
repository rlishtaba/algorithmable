module Algorithmable
  module Cache
    class PrimitiveMinHeap
      include Algorithmable::Cache::Methods
      extend Forwardable

      def_delegators :@index, :size, :empty?
      def_delegators :@storage, :key?

      def initialize(index = [])
        @storage = {}
        @index = index
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

      private

      def sink(key)
        @index.delete(key)
        @index.push(key)
      end
    end
    private_constant :PrimitiveMinHeap
  end
end
