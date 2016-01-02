require 'monitor'

module Algorithmable
  module DataStructs
    class Queue
      include Enumerable
      include MonitorMixin
      attr_reader :size

      SEPARATOR = ':'

      NoSuchElementError = Class.new(RuntimeError)

      def initialize
        @first = nil
        @last = nil
        @size = 0
        super
      end

      def empty?
        !@size.nonzero?
      end

      def peek
        synchronize do
          fail NoSuchElementError if empty?
          @first.item
        end
      end

      def enqueue(item)
        synchronize do
          old_last = @last
          @last = Node.new item
          @last.succ = nil
          @first = @last if empty?
          old_last.succ = @last unless empty?
          @size = @size.next
        end
      end

      def dequeue
        synchronize do
          fail NoSuchElementError if empty?
          item = @first.item
          @first = @first.succ
          @size = @size.pred
          @last = nil if empty?
          item
        end
      end

      def to_s
        synchronize do
          to_a.join SEPARATOR
        end
      end

      def each(&block)
        synchronize do
          (@first || []).each(&block)
        end
      end

      class Node
        attr_accessor :succ, :item

        def initialize(item)
          @item = item
          @succ = nil
        end

        def to_s
          @item.to_s
        end

        def each(&block)
          yield self
          @succ.each(&block) if @succ
        end
      end
    end
  end
end
