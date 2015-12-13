module Algorithmable
  module Sort
    class Bubble
      def self.sort(*items)
        new.sort(*items)
      end

      def sort(*items)
        loop do
          swapped = false
          (items.size.pred).times do |index|
            if (items[index] <=> items[index.next]) == 1
              items = swap(index, *items)
              swapped = true
            end
          end
          break unless swapped
        end
        items
      end

      private

      def swap(index, *items)
        items[index], items[index.next] = items[index.next], items[index]
        items
      end
    end
  end
end
