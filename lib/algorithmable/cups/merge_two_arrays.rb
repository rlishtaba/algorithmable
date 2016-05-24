module Algorithmable
  module Cups
    # Given two lists of numbers in descending order, write a function that returns a single list sorted in the same order.
    #     E.g.
    #     list1: 4, 2, 1
    # list2: 7, 6, 5, 3
    # Result list should be: 7,6,5,4,3,2,1

    # right = [4, 2, 1]
    # left = [7, 6, 5, 3]
    #
    # l1 = [1]
    # l2 = []

    def merge_arrays(left, right)
      sorted = []

      while !left.empty? && !right.empty?
        if left[0] >= right[0]
          sorted.push(left.shift)
        else
          sorted.push(right.shift)
        end
      end

      sorted += left if right.empty?
      sorted += right if left.empty?
      sorted # [1]
    end
  end
end
