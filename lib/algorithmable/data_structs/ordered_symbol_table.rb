module Algorithmable
  module DataStructs
    class OrderedSymbolTable
      extend Forwardable
      include Algorithmable::Trees

      private_methods :new_binary_search_tree

      def_delegators :@imp, :[]=, :[], :key?, :empty?, :size, :keys, :max, :min, :floor, :ceiling, :rank, :delete

      def initialize(key_type, value_type)
        @imp = new_binary_search_tree(key_type, value_type)
      end
    end
  end
end
