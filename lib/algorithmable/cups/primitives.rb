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
        array_tail = 1

        chars.size.times do |cur_char_index|
          next unless cur_char_index.nonzero?
          prev_char_index = 0

          while prev_char_index < array_tail
            break if chars[cur_char_index] == chars[prev_char_index]
            prev_char_index += 1
          end

          if prev_char_index == array_tail
            chars[array_tail] = chars[cur_char_index]
            array_tail += 1
          end
        end

        # trim all after new tail
        chars[0...array_tail]
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

      def ransom_note(note, magazine)
        ascii_table = Hash.new 0
        source = magazine.chars

        source.each do |char|
          ascii_table[char] += 1
        end

        note.chars.each do |char|
          return false unless ascii_table[char].nonzero?
          ascii_table[char] -= 1
        end

        true
      end

      def anagrams?(string, other_string)
        return false unless string.size == other_string.size
        registry = Hash.new 0
        string.each_char do |char|
          registry[char] += 1
        end
        other_string.chars.none? do |char|
          (registry[char] -= 1) < 0
        end
      end

      def parse_string_with_escapes(string)
        app_state = {
            chunk_id: 0,
            escaping: false,
            prev_char: nil,
            chunks: Hash.new { |h, k| h[k] = [] }
        }

        string.each_char do |char|
          parse_char char, app_state
        end

        app_state[:chunks].values
      end

      def parse_char(char, state)
        chunk_id = state[:chunk_id]
        case char
          when %r{[\(\{\[\)\}\]]}
            state[:escaping] = char != state[:prev_char]
            state[:chunks][chunk_id] << char unless state[:escaping]
          else
            if state[:escaping]
              chunk_id = state[:chunk_id] += 1
              state[:escaping] = false
            end
            state[:chunks][chunk_id] << char
        end
        state[:prev_char] = char
      end

      def remove_duplicates_from_list(list)
        map = {}
        prev = nil
        node = list.front

        while node
          if map[node.item]
            prev.next = node.next
          else
            map[node.item] = true
            prev = node
          end
          node = node.next
        end
      end

      def nth_to_last_in_list(list, nth = 1)
        return if list.nil? || list.empty?
        node1 = list.front
        node2 = list.front

        nth.downto(nth).each do |i|
          if node1

          end
        end
      end

=begin

int maxDiff(int arr[], int arr_size)
{
  int max_diff = arr[1] - arr[0];
  int i, j;
  for(i = 0; i < arr_size; i++)
  {
    for(j = i+1; j < arr_size; j++)
    {
      if(arr[j] - arr[i] > max_diff)
         max_diff = arr[j] - arr[i];
    }
  }
  return max_diff;
}

getBestTime(int stocks[], int sz, int &buy, int &sell) {
  int min = 0;
  int maxDiff = 0;
  buy = sell = 0;
  for (int i = 0; i < sz; i++) {
    if (stocks[i] < stocks[min])
      min = i;
    int diff = stocks[i] - stocks[min];
    if (diff > maxDiff) {
      buy = min;
      sell = i;
      maxDiff = diff;
    }
  }
}

=end


      def sort_linked_list(node)
        return unless node || node.empty?
        swapped = false
        prev = nil

        begin
          swapped = false
          current = node

          until current.next == prev
            if current.item > current.next.item
              swap_nodes current, current.next
              swapped = true
            end
            current = current.next
          end

          prev = current
        end while swapped
      end

      def swap_nodes(node1, node2)
        tmp = node1.item
        node1.item = node2.item
        node2.item = tmp
      end
    end
  end
end
