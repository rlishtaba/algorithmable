module Algorithmable
  module DataStructs
    module LinkedList
      autoload :Node, 'algorithmable/data_structs/linked_list/node'
      autoload :Impl, 'algorithmable/data_structs/linked_list/impl'

      def self.new
        Impl.new
      end
    end
  end
end
