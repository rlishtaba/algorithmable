module Algorithmable
  module DataStructs
    class Bag
      include Enumerable
      attr_reader :size, :head

      def initialize
        @head = nil
        @size = 0
      end

      def empty?
        @head.nil?
      end

      def add(item)
        old_head = @head
        @head = Node.new(item)
        @head.succ = old_head
        @size = @size.next
      end

      def each(&block)
        @head.each(&block) if @head
      end

      class Node
        attr_accessor :succ, :item

        def initialize(item)
          @item = item
          @succ = nil
        end

        def each(&block)
          yield self
          @succ.each(&block) if @succ
        end
      end
      private_constant :Node
    end
  end
end
