module Algorithmable
  module DataStructs
    module Tree
      autoload :Binary, 'algorithmable/data_structs/tree/binary'
      autoload :BinarySearch, 'algorithmable/data_structs/tree/binary_search'
      autoload :Node, 'algorithmable/data_structs/tree/node'

      def new_ordered_binary_tree(collection = [])
        BinarySearch.new(collection)
      end
    end
  end
end
