module Algorithmable
  module DataStructs
    module LinkedList
      autoload :Interface, 'algorithmable/data_structs/linked_list/interface'
      autoload :Node, 'algorithmable/data_structs/linked_list/node'
      autoload :Singly, 'algorithmable/data_structs/linked_list/singly'
      autoload :Doubly, 'algorithmable/data_structs/linked_list/doubly'

      private_constant :Node

      def new_singly_linked_list(collection = [])
        Singly.new collection
      end

      def new_doubly_linked_list(collection = [])
        Doubly.new collection
      end
    end
  end
end
