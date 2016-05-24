module Algorithmable
  module Sort
    class Bubble
      extend Algorithmable::Sort::Utils
      #
      # Time О(N^2), stable and slow
      # Space О(N)
      #
      def self.sort(collection)
        length = collection.length - 1
        loop do
          swapped = false
          0.upto(length).each do |i|
            if 1 == (collection[i] <=> collection[i + 1])
              swap(collection, i)
              swapped = true
            end
          end
          break unless swapped
        end
        collection
      end
    end
  end
end
