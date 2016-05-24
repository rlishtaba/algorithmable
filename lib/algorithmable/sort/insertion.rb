module Algorithmable
  module Sort
    class Insertion
      extend Algorithmable::Sort::Utils
      #
      # Time О(N^2), stable and slow
      # Space Complexity: О(N)
      #
      def self.sort(collection)
        return collection if 2 > collection.length
        1.upto(collection.length - 1).each do |i|
          curr_char = collection[i]
          j = i - 1
          while 0 <= j && collection[j] > curr_char
            collection[j + 1] = collection[j]
            j -= 1
          end
          collection[j + 1] = curr_char
        end
        collection
      end
    end
  end
end
