module Algorithmable
  module Sort
    autoload :Utils, 'algorithmable/sort/utils'
    autoload :Selection, 'algorithmable/sort/selection'
    autoload :Insertion, 'algorithmable/sort/insertion'
    autoload :Shell, 'algorithmable/sort/shell'
    autoload :Shuffle, 'algorithmable/sort/shuffle'
    autoload :Merge, 'algorithmable/sort/merge'
    autoload :Bubble, 'algorithmable/sort/bubble'
    autoload :BinaryHeap, 'algorithmable/sort/binary_heap'
    autoload :QuickSort, 'algorithmable/sort/quick_sort'

    private_constant :Merge, :Bubble, :BinaryHeap, :Insertion, :QuickSort, :Selection

    class << self
      def quick(collection)
        QuickSort.sort(collection)
      end

      def merge(collection)
        Merge.sort(collection)
      end

      def bubble(collection)
        Bubble.sort(collection)
      end

      def binary_heap(collection)
        BinaryHeap.sort(collection)
      end

      def selection(container)
        Selection.sort(container)
      end

      def insertion(collection)
        Insertion.sort(collection)
      end

      def shell(collection)
        Shell.sort(collection)
      end

      def shuffle(collection)
        Shuffle.sort(collection)
      end
    end
  end
end
