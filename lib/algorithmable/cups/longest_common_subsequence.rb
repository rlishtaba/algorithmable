module Algorithmable
  module Cups
    class LongestCommonSubSequence
      #
      # @see https://en.wikipedia.org/wiki/Longest_common_subsequence_problem
      #
      # >> a = "aaaaabbbb34354354345"
      # >> b = "abbb34aaabbbb"
      # >> find(a, b)
      # => "aaaabbbb"
      #
      def find(a, b)
        max_len = Array.new(a.size + 1, 0)
        max_len.map! { Array.new(b.size + 1, 0) }

        (a.size - 1).downto(0) do |i|
          (b.size - 1).downto(0) do |j|
            if a[i] == b[j]
              max_len[i][j] = 1 + max_len[i + 1][j + 1]
            else
              max_len[i][j] = [max_len[i + 1][j], max_len[i][j + 1]].max
            end
          end
        end

        res = ''
        i = 0
        j = 0
        while max_len[i][j] != 0 && i < a.size && j < b.size
          if a[i] == b[j]
            res << a[i]
            i += 1
            j += 1
          else
            if max_len[i][j] == max_len[i + 1][j]
              i += 1
            else
              j += 1
            end
          end
        end
        res
      end
    end
  end
end
