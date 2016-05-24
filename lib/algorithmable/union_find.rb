module Algorithmable
  module UnionFind
    def self.new(quantity)
      Impl.new(quantity)
    end

    class Impl
      attr_reader :quantity

      def initialize(quantity, find_strategy = SimpleFind.new, union_strategy = SimpleUnion.new)
        @index = (0..quantity).to_a
        @quantity = quantity
        @find_strategy = find_strategy
        @union_strategy = union_strategy
      end

      def find(p)
        @find_strategy.find(p, @index)
      end

      def union(p1, p2)
        @union_strategy.union(p1, p2, @index)
        @quantity -= 1
      end

      def connected?(p1, p2)
        find(p1) == find(p2)
      end
    end

    class SimpleFind
      def find(p, collection)
        collection[p]
      end
    end

    class SimpleUnion
      def union(p1, p2, collection)
        p1_id = collection[p1]
        p2_id = collection[p2]
        return collection if p1_id == p2_id
        collection.each_index do |i|
          collection[i] = p2_id if collection[i] == p1_id
        end
        collection
      end
    end

    private_constant :Impl, :SimpleFind, :SimpleUnion
  end
end
