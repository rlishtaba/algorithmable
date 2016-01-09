module Algorithmable
  module Searches
    autoload :BinarySearch, 'algorithmable/search/binary_search'
    autoload :BinarySearchTree, 'algorithmable/search/binary_search_tree'

    def binary_search(element, collection)
      BinarySearch.lookup(element, collection)
    end

    def new_binary_search_tree(key_type, value_type)
      BinarySearchTree.new key_type, value_type
    end
  end
end
