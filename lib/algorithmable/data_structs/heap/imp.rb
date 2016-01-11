module Algorithmable
  module DataStructs
    module Heap
      class Imp
        attr_reader :size

        def initialize(collection = [], &block)
          @comparison_function = block || -> (this, other) { (this <=> other) < 0 }
          @queue = []
          @size = 0
          collection.each do |item|
            enqueue item
          end
        end

        def empty?
          !@size.nonzero?
        end

        def enqueue(key)
          @size = @size.next
          @queue[@size] = key
          swim @size
          maintain_heap_invariant!
        end

        def dequeue
          return if empty?
          maximum = @queue[1]
          exchange 1, @size
          @size = @size.pred
          sink 1
          @queue[@size.next] = nil
          maintain_heap_invariant!
          maximum
        end

        def peek
          return if empty?
          @queue[1]
        end

        private

        def exchange(this, other)
          swap = @queue[this]
          @queue[this] = @queue[other]
          @queue[other] = swap
        end

        def maintain_heap_invariant!
          fail "Heap is not invariant now: #{inspect}!" unless assert_heap_invariant(1)
        end

        def assert_heap_invariant(index)
          return true if index > @size
          left = 2 * index
          right = 2 * index + 1
          return false if left <= @size && agreed(index, left)
          return false if right <= @size && agreed(index, right)
          assert_heap_invariant(left) && assert_heap_invariant(right)
        end

        def swim(index)
          while index > 1 && agreed(index / 2, index)
            exchange(index, index / 2)
            index /= 2
          end
        end

        def agreed(this, that)
          @comparison_function.call(@queue[this], @queue[that])
        end

        def sink(index)
          while 2 * index <= @size
            temp_index = 2 * index
            temp_index = temp_index.next if temp_index < @size && agreed(temp_index, temp_index.next)
            break unless agreed(index, temp_index)
            exchange(index, temp_index)
            index = temp_index
          end
        end
      end
    end
  end
end
