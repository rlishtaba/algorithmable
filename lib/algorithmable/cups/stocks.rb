module Algorithmable
  module Cups
    module Stocks

      # If you were only permitted to buy one share of the stock and sell one share of the stock,
      # design an algorithm to find the best times to buy and sell.
      def get_best_time(stocks)
        min = 0
        max_diff = 0
        buy = 0
        sell = 0
        0.upto(stocks.size - 1).each do |i|
          min = i if stocks[i] < stocks[min]
          diff = stocks[i] - stocks[min]
          if diff > max_diff
            buy = min
            sell = i
            max_diff = diff
          end
        end
        {buy_at: buy, sell_at: sell, max_profit: max_diff}
      end

      # another way
      #
      def find_max_profit(arr)
        max_diff = arr[1] - arr[0]
        0.upto(arr.size).each do |i|
          (i + 1).upto(arr.size - 1).each do |j|
            if arr[j] - arr[i] > max_diff
              max_diff = arr[j] - arr[i]
            end
          end
        end
        max_diff
      end

      # The cost of a stock on each current_day is given in an array, find the max profit that you can make by
      # buying and selling in those days.
      # For example, if the given array is {100, 180, 260, 310, 40, 535, 695},
      # the maximum profit can earned by buying on current_day 0, selling on current_day 3.
      # Again buy on current_day 4 and sell on current_day 6. If the given array of prices is sorted in decreasing order,
      # then profit cannot be earned at all.

      # If we are allowed to buy and sell only once, then we can use following algorithm.
      # Maximum difference between two elements. Here we are allowed to buy and sell multiple times.
      #
      # Following is algorithm for this problem.
      # 1. Find the local minima and store it as starting index. If not exists, return.
      # 2. Find the local maxima. and store it as ending index. If we reach the end, set the end as ending index.
      # 3. Update the solution (Increment count of buy sell pairs)
      # 4. Repeat the above steps if end is not reached.
      #
      # http://www.geeksforgeeks.org/stock-buy-sell/

      def buy_and_sell_stocks(stocks)
        return if stocks.size <= 1
        count = 0
        i = 0
        length = stocks.length
        solutions = []

        while i < (length - 1)

          # Find Local Minima. Note that the limit is (n-2) as we are
          # comparing present element to the next element.
          while i < (length - 1) && (stocks[i + 1] <= stocks[i])
            i += 1
          end

          if i == length - 1
            puts 'break'
            break
          end

          solutions[count] ||= {}
          solutions[count][:buy] = i

          i += 1

          # Find Local Maxima.  Note that the limit is (n-1) as we are
          # comparing to previous element
          while i < length && (stocks[i] >= stocks[i - 1])
            i += 1
          end
          solutions[count][:sell] = i - 1

          count += 1
        end

        solutions
      end


      def ruby_buy_and_sell_stocks(stocks)
        total_days = stocks.size - 1
        current_day = 0
        series_count = 0
        series = []

        while current_day < total_days
          while current_day <= total_days && stocks[current_day + 1] <= stocks[current_day]
            current_day += 1
          end

          return series if current_day == total_days

          series[series_count] = {buy: 0, sell: 0}
          series[series_count][:buy] = current_day
          current_day += 1

          while current_day <= total_days && stocks[current_day] >= stocks[current_day - 1]
            current_day += 1
          end

          series[series_count][:sell] = current_day - 1
          series_count += 1
        end

        series
      end
    end
  end
end