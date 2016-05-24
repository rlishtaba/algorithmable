module Algorithmable
  module Sort
    class Merge
      def self.sort(collection)
        return collection if collection.length <= 1
        mid = collection.length / 2
        left = collection[0...mid]
        right = collection[mid...collection.length]
        merge(sort(left), sort(right))
      end

      private

      def self.merge(left, right)
        sorted = []
        until left.empty? || right.empty?
          left.first <= right.first ? sorted << left.shift : sorted << right.shift
        end
        sorted + left + right
      end
    end
  end
end
