module Algorithmable
  module Sort
    class Bubble
      def self.sort(collection)
        new.sort(collection)
      end

      def sort(collection)
        loop do
          swapped = false
          (collection.size.pred).times do |index|
            if (collection[index] <=> collection[index.next]) == 1
              collection = swap(index, collection)
              swapped = true
            end
          end
          break unless swapped
        end
        collection
      end

      private

      def swap(index, collection)
        collection[index], collection[index.next] = collection[index.next], collection[index]
        collection
      end
    end
  end
end
