module Algorithmable
  module Sort
    class Shuffle
      extend Algorithmable::Sort::Utils

      def self.sort(collection)
        return collection if collection.empty? || 2 > collection.length
        collection.length.times do |i|
          exchange(i, rand(i + 1), collection)
        end
        collection
      end
    end
  end
end
