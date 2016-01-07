module Algorithmable
  module Puzzles
    class JosephusProblem
      include Algorithmable::DataStructs

      def initialize(prisoners, every)
        @prisoners = prisoners
        @every = every
      end

      def solve
        queue = new_fifo_queue
        @prisoners.times { |item| queue.enqueue(item) }
        positions = []
        until queue.empty?
          (@every - 1).times do
            queue.enqueue queue.dequeue
          end
          positions << queue.dequeue
        end
        positions
      end
    end
  end
end
