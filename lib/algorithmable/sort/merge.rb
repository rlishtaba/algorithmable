module Algorithmable
  module Sort
    class Merge
      def self.sort(collection)
        new.sort(collection)
      end

      def sort(collection)
        return collection if collection.size <= 1
        mid = collection.size / 2
        left = collection[0...mid]
        right = collection[mid...collection.size]
        merge(sort(left), sort(right))
      end

      private

      def merge(left, right)
        sorted = []
        until left.empty? || right.empty?
          left.first <= right.first ? sorted << left.shift : sorted << right.shift
        end
        sorted + left + right
      end
    end
  end
end
