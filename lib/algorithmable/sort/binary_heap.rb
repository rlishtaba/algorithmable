module Algorithmable
  module Sort
    class BinaryHeap
      def self.sort(collection)
        new.sort(collection)
      end

      def sort(collection)
        fail NotImplementedError, collection
      end

      private

      def swim(node)
        fail NotImplementedError, node
      end

      def sink(node)
        fail NotImplementedError, node
      end
    end
  end
end
