module Algorithmable
  module Sort
    class Merge
      def self.sort(*items)
        new.sort *items
      end

      def sort(*items)
        return items if items.size <= 1
        mid = items.size / 2
        left = items[0...mid]
        right = items[mid...items.size]
        merge(sort(*left), sort(*right))
      end

      private

      def merge(left, right)
        sorted = []
        until left.empty? or right.empty?
          left.first <= right.first ? sorted << left.shift : sorted << right.shift
        end
        sorted + left + right
      end
    end
  end
end