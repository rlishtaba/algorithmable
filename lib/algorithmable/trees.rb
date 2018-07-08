module Algorithmable
  module Trees
    autoload :BinarySearchTree, 'algorithmable/trees/bst'

    def new_binary_search_tree(k_type, v_type)
      BinarySearchTree.new(k_type, v_type)
    end
  end
end
