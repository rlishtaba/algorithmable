module Algorithmable
  module DataStructs
    autoload :Deque, 'algorithmable/data_structs/deque'
    autoload :Bag, 'algorithmable/data_structs/bag'
    autoload :LinkedList, 'algorithmable/data_structs/linked_list'
    autoload :Queue, 'algorithmable/data_structs/queue'
    autoload :Stack, 'algorithmable/data_structs/stack'
    autoload :OrderedSymbolTable, 'algorithmable/data_structs/ordered_symbol_table'
    autoload :Heap, 'algorithmable/data_structs/heap'
    autoload :Tree, 'algorithmable/data_structs/tree'

    include LinkedList
    include Tree

    def new_bag
      Bag.new
    end

    def new_fifo_queue
      Queue.new
    end

    def new_lifo_queue
      Stack.new
    end

    def new_ordered_symbol_table(key_type, value_type)
      OrderedSymbolTable.new(key_type, value_type)
    end

    def new_priority_queue(collection, &block)
      Heap::Max.new(collection, &block)
    end

    def new_max_priority_queue(collection = [])
      Heap::Max.new(collection)
    end

    def new_min_priority_queue(collection = [])
      Heap::Min.new(collection)
    end
  end
end
