module Algorithmable
  module Cups
    module TwoSum
      # Given an array of integers, find two numbers such that they add up to a specific target number.
      #
      # The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
      #
      # For example:
      #
      # Input: numbers={2, 7, 11, 15}, target=9
      # Output: index1=1, index2=2
      class Quadratic
        def solve(collection, target)
          result = {}
          collection.each_with_index do |_, index|
            j = index + 1
            while j < collection.size
              if collection[index] + collection[j] == target
                result[index] = collection[index]
                result[j] = collection[j]
              end
              j += 1
            end
          end
          result
        end
      end


      def new_quadratic_solution
        Quadratic.new
      end
    end
  end
end