module Algorithmable
  module Sort
    class Selection
      extend Algorithmable::Sort::Utils
      # Does sorting in O(n2) time (quadratic time)
      #
      def self.sort(collection)
        return collection if collection.empty? || 1 >= collection.length
        length = collection.length - 1

        0.upto(length).each do |i|
          min = i
          (1 + i).upto(length).each do |j|
            min = j if collection[j] < collection[min]
          end
          exchange(i, min, collection)
        end

        collection
      end
    end
  end
end
