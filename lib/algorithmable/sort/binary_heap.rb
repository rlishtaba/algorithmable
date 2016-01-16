module Algorithmable
  module Sort
    class BinaryHeap
      include Algorithmable::DataStructs

      def self.sort(collection)
        new(collection).sort
      end

      def initialize(collection = [])
        @heap = new_min_priority_queue collection
      end

      def sort
        [].tap do |result|
          result << @heap.dequeue until @heap.empty?
        end
      end
    end
  end
end
