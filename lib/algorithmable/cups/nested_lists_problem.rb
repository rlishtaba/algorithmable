module Algorithmable
  module Cups
    module NestedListsProblem
      # /**
      # * Given a nested list of integers, returns the sum of all integers in the list weighted by their depth
      # * For example, given the list {{1,1},2,{1,1}} the function should return 10 (four 1's at depth 2, one 2 at depth 1)
      # * Given the list {1,{4,{6}}} the function should return 27 (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3)
      # */
      #
      # public int depthSum (List<NestedInteger> input)
      # {
      #   // ur implementation here
      # }
      #
      # **
      # * This is the interface that represents nested lists.
      # * You should not implement it, or speculate about its implementation.
      # */
      # public interface NestedInteger
      # {
      #    /** @return true if this NestedInteger holds a single integer, rather than a nested list */
      #    boolean isInteger();
      #
      #    /** @return the single integer that this NestedInteger holds, if it holds a single integer
      #     *  Return null if this NestedInteger holds a nested list
      #     */
      #    Integer getInteger();
      #
      #    /** @return the nested list that this NestedInteger holds, if it holds a nested list
      #     *  Return null if this NestedInteger holds a single integer
      #    */
      #    List<NestedInteger> getList();
      #  }

      def make_list(collection, level = 0, buffer = new_nested_list)
        collection.each do |entry|
          if entry.is_a? Array
            buffer << make_list(entry, level + 1)
          else
            buffer << entry
          end
        end
        buffer
      end

      def new_nested_list(collection = [])
        NestedListImp.new collection
      end

      def solve_puzzle(nested_list)
        PuzzleSolver.find_sum_of_nodes_in nested_list
      end

      class NestedListImp
        attr_accessor :value

        def initialize(collection = [])
          @collection = collection
        end

        def integer?
          @collection.is_a? Fixnum
        end

        def <<(other)
          @collection << other
        end

        def value
          @collection
        end

        def each(&block)
          @collection.each(&block)
        end
      end

      private_constant :NestedListImp

      class PuzzleSolver
        def self.find_sum_of_nodes_in(nested_list)
          new.solve nested_list
        end

        def solve(list)
          parts = recursive_traversal list, 1
          parts.inject(:+)
        end

        def recursive_traversal(list, level, sum = [])
          list.each do |item|
            if item.integer?
              sum << item * level
            else
              recursive_traversal item, level + 1, sum
            end
          end
          sum
        end
      end

      private_constant :PuzzleSolver
    end
  end
end
