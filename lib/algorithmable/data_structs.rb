module Algorithmable
  module DataStructs
    autoload :Deque, 'algorithmable/data_structs/deque'
    autoload :Bag, 'algorithmable/data_structs/bag'
    autoload :LinkedList, 'algorithmable/data_structs/linked_list'
    autoload :Queue, 'algorithmable/data_structs/queue'
    autoload :Stack, 'algorithmable/data_structs/stack'

    def new_bag
      Bag.new
    end

    def new_linked_list
      LinkedList.new
    end

    def new_fifo_queue
      Queue.new
    end

    def new_lifo_queue
      Stack.new
    end
  end
end
