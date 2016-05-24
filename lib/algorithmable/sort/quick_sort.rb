module Algorithmable
  module Sort
    class QuickSort
      extend Algorithmable::Sort::Utils

      def self.sort(collection)
        do_effect(collection, 0, collection.length - 1)
      end

      private

      def self.do_effect(collection, lo, hi)
        return collection if hi <= lo
        lo_or_hi = partition(collection, lo, hi)
        do_effect(collection, lo, lo_or_hi - 1)
        do_effect(collection, lo_or_hi + 1, hi)
      end

      # private
      #
      # def self.partition(ary, from, to)
      #   pivot = ary[from]
      #   i = from + 1
      #   (from + 1).upto(to).each do |j|
      #     if ary[j] < pivot
      #       ary[i], ary[j] = ary[j], ary[i]
      #       i += 1
      #     end
      #   end
      #   ary[i-1], ary[from] = ary[from], ary[i-1]
      #   i
      # end
    end
  end
end
