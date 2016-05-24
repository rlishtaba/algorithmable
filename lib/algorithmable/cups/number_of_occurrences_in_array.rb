module Algorithmable
  module Cups
    module NumberOfOccurrencesInArray
      include Algorithmable::Searches

      def linear_solve(collection, target)
        result = Hash.new 0
        collection.each do |item|
          result[item] += 1
        end
        result[target]
      end

      def logarithmic(collection, target)
        i = find_first_one collection, 0, collection.size - 1, target
        j = find_last_one collection, i, collection.size - 1, target
        j - i + 1
      end

      def find_first_one(collection, low, high, target)
        #   if(high >= low)
        #   {
        #     int mid = (low + high)/2;  /*low + (high - low)/2;*/
        #     if( ( mid == 0 || x > arr[mid-1]) && arr[mid] == x)
        #       return mid;
        #     else if(x > arr[mid])
        #       return first(arr, (mid + 1), high, x, n);
        #     else
        #       return first(arr, low, (mid -1), x, n);
        #   }
        #   return -1
      end

      def find_last_one(collection, low, high, target)
        # if(high >= low)
        #   {
        #     int mid = (low + high)/2;  /*low + (high - low)/2;*/
        #     if( ( mid == n-1 || x < arr[mid+1]) && arr[mid] == x )
        #       return mid;
        #     else if(x < arr[mid])
        #       return last(arr, low, (mid -1), x, n);
        #     else
        #       return last(arr, (mid + 1), high, x, n);
        #   }
        #   return -1;
      end
    end
  end
end
