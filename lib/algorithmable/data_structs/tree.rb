module Algorithmable
  module DataStructs
    module Tree
      autoload :Binary, 'algorithmable/data_structs/tree/binary'
      autoload :Node, 'algorithmable/data_structs/tree/node'

      def new_binary_tree(collection = [])
        Binary.new(collection)
      end
    end
  end
end
