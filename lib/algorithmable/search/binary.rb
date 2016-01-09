module Algorithmable
  module Search
    class Binary
      def self.lookup(element, in_collection)
        new.lookup(element, in_collection)
      end

      def lookup(element, collection)
        return if element.nil?
        traverse element, collection, 0, collection.length - 1
      end

      def traverse(element, collection, low, high)
        while low <= high
          mid = low + (high - low) / 2
          value_at = collection[mid]
          if element < value_at
            high = mid.pred
          elsif element > value_at
            low = mid.next
          else
            return mid
          end
        end
      end
    end
  end
end
