module Algorithmable
  module Search
    class Binary
      def self.lookup(element, in_collection)
        new.lookup(element, in_collection)
      end

      def lookup(element, collection)
        traverse element, collection, 0, collection.length - 1
      end

      def traverse(element, collection, low, high)
        while low <= high
          mid = low + (high - low) / 2
          if element < collection[mid]
            high = mid.pred
          elsif element > collection[mid]
            low = mid.next
          else
            return mid
          end
        end
      end
    end
  end
end
