module Algorithmable
  module DataStructs
    class OrderedSymbolTable
      extend Forwardable

      def_delegators :@imp, :[]=, :[], :key?, :empty?, :size, :keys, :max, :min, :floor, :ceiling, :rank, :delete

      def initialize(key_type, value_type)
        search_strategy_factory = Object.new.extend Algorithmable::Searches
        @imp = search_strategy_factory.new_binary_search_tree(key_type, value_type)
      end
    end
  end
end
