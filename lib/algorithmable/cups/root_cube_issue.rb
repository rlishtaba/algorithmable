module Algorithmable
  module Cups
    module RootCubeIssue
      # What is the fastest way to compute cube root?

      ACCURACY = 0.0001

      def self.binary_search(num, accuracy = ACCURACY)
        low = 0
        high = num
        mid = 0

        loop do
          mid = (low + high) / 2.0
          cube = mid * mid * mid
          break if (cube - num).abs <= accuracy
          if cube > num
            high = mid
          else
            low = mid
          end
        end
        mid
      end

      def self.newton_approximation(num, accuracy = ACCURACY)
        x = 1
        n = 10
        loop do
          0.upto(n).each do
            x = (2 * x + num / (x * x)) / 3.0
          end
          break if ((x * x * x) - num).abs < accuracy
        end
        x
      end
    end
  end
end
