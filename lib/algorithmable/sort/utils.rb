module Algorithmable
  module Sort
    module Utils
      # @param [Integer] a
      # @param [Integer] bottom
      # @param [Array] top
      # @return [Integer] Integer representing new pivot location
      def partition(a, bottom, top)
        i = bottom
        j = top.succ
        v = a[bottom]
        loop do
          while a[i += 1] < v
            break if i == top
          end
          while v < a[j -= 1]
            break if j == bottom
          end
          break if i >= j
          cur_i = a[i]
          a[i] = a[j]
          a[j] = cur_i
        end
        cur_bottom = a[bottom]
        a[bottom] = a[j]
        a[j] = cur_bottom
        j
      end

      # def partition(ary, from, to)
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

      # @param [Integer] from
      # @param [Integer] to
      # @param [Array] collection
      # @return [Object]
      def exchange(from, to, collection)
        return collection if from == to
        local_from = collection[from]
        collection[from] = collection[to]
        collection[to] = local_from
        collection
      end

      # @param [Integer] collection
      # @param [Integer] i
      # @return [Array] collection
      def swap(collection, i)
        current = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = current
        collection
      end
    end
  end
end
