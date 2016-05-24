module Algorithmable
  module Sort
    class Shell
      extend Algorithmable::Sort::Utils
      def self.sort(collection)
        return collection if 2 > collection.length
        length = collection.length
        h = 1

        h = 3 * h + 1 while h < length / 3

        while h >= 1
          h.upto(length - 1).each do |i|
            j = i
            while j >= h && collection[j] < collection[j - h]
              exchange(j, j - h, collection)
              j -= h
            end
          end
          h /= 3
        end

        collection
      end
    end
  end
end
