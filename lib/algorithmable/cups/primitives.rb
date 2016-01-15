module Algorithmable
  module Cups
    module Primitives
      # this module contains a lot of C style code. It is done intentionally.
      # All the methods avoiding using already existent algorithms in Ruby.
      # Algorithms/solutions should be implemented in place

      def replace_space_chars(string, expression = '%20')
        return unless string
        space_count = 0
        length = string.length
        replacement = expression.chars.reverse.freeze
        length.times { |i| space_count += 1 if string[i] == ' ' }
        new_length = length + space_count * 2
        chars = Array.new(new_length, ?\x00)

        (0..length.pred).to_a.reverse_each do |i|
          if string[i] == ' '
            replacement.each_with_index do |char, index|
              j = index + 1
              chars[new_length - j] = char
            end
            new_length = new_length - replacement.length
          else
            new_length -= 1
            chars[new_length] = string[i]
          end
        end

        chars.join
      end

      def chars_is_uniq?(string)
        return unless string
        map = Array.new 127, false
        string.chars.each do |char|
          return false if map[char.ord]
          map[char.ord] = true
        end
      end

      def reverse_string(string)
        return unless string
        chars = string.chars
        reversed = ''
        string.size.times { reversed << chars.pop }
        reversed
      end

      def remove_duplicated_chars(chars = [])
        return if chars.empty? || chars.size < 2
        new_tail = 1

        chars.size.times do |cur_char|
          prev_char = 0

          while prev_char < new_tail
            break if chars[cur_char] == chars[prev_char]
            prev_char += 1
          end

          if prev_char == new_tail
            chars[new_tail] = chars[cur_char]
            new_tail += 1
          end
        end

        # trim all after new tail
        chars[0..new_tail - 1]
      end

      def find_cycled_node(root)
        return unless root.next or root.next.next
        slow = root
        fast = root

        until fast.next.nil?
          slow = slow.next
          fast = fast.next.next
          break if slow == fast
        end

        # return, no cycle
        return if fast.next.nil?

        slow = root
        until slow == fast
          slow = slow.next
          fast = fast.next
        end

        # at this point return value is a node which is tail pointing to.
        fast
      end
    end
  end
end
