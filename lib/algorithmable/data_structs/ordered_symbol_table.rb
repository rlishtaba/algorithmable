module Algorithmable
  module DataStructs
    # 
    # Ordered Symbol Table. Implementation using Unbalanced Binary Tree.
    #
    class OrderedSymbolTable
      def initialize(key_type, value_type)
        @key_type = key_type
        @value_type = value_type
        @root = nil
      end

      def empty?
        !size.nonzero?
      end

      def size
        node_size(@root)
      end

      def key?(key)
        assert_key_type(key)
        !self[key].nil?
      end

      def [](key)
        assert_key_type(key)
        impl_get(@root, key)
      end

      def []=(key, value)
        assert_value_type(value)
        assert_key_type(key)
        delete key
        @root = impl_put(@root, key, value)
        check_tree
      end

      def delete_min
        @root = impl_delete_min @root
        check_tree
      end

      def delete_max
        @root = impl_delete_max @root
        check_tree
      end

      def delete(key)
        assert_key_type(key)
        @root = impl_delete(@root, key)
        check_tree
      end

      def min
        impl_min(@root).key
      end

      def max
        impl_max(@root).key
      end

      def floor(key)
        assert_key_type(key)
        return unless key || empty?
        found = impl_floor(@root, key)
        return unless found
        found.key
      end

      def ceiling(key)
        assert_key_type(key)
        return unless key || empty?
        found = impl_ceiling(@root, key)
        return unless found
        found.key
      end

      def select(integer)
        return if integer < 0 || integer >= size
        found = impl_select(@root, integer)
        found.key
      end

      def rank(key)
        assert_key_type(key)
        return unless key
        impl_rank @root, key
      end

      private

      def check_tree
        true
      end

      def assert_value_type(value)
        fail "Type expectation not met. Use value type `#{@value_type}` instead." unless value.is_a? @value_type
      end

      def assert_key_type(key)
        fail "Type expectation not met. Use key type `#{@key_type}` instead." unless key.is_a? @key_type
      end

      def impl_rank(node, key)
        return 0 unless node
        comparison = key <=> node.key
        if comparison < 0
          impl_rank(node.left, key)
        elsif comparison > 0
          1 + node_size(node.left) + impl_rank(node.right, key)
        else
          node_size node.left
        end
      end

      def impl_select(node, index)
        return unless node
        left_size = node_size(node.left)
        if left_size > index
          impl_select(node.left, index)
        elsif left_size < index
          impl_select node.right, (index - left_size - 1)
        else
          node
        end
      end

      def impl_ceiling(node, key)
        return unless node
        comparison = key <=> node.key
        return node if 0 == comparison
        if comparison < 0
          found = impl_ceiling(node.left, key)
          return found if found
          return node
        end
        impl_ceiling node.right, key
      end

      def impl_floor(node, key)
        return unless node
        comparison = key <=> node.key
        return node if 0 == comparison
        return impl_floor(node.left, key) if comparison < 0
        found = impl_floor(node.right, key)
        return found if found
        node
      end

      def impl_delete(node, key)
        return unless node
        comparison = key <=> node.key
        if comparison < 0
          node.left = impl_delete(node.left, key)
        elsif comparison > 0
          node.right = impl_delete(node.right, key)
        else
          return unless node.left || node.right
          temp = node
          node = impl_min(temp.right)
          node.right = impl_delete_min(temp.right)
          node.left = temp.left
        end
        node.size = computed_node_size(node)
        node
      end

      def impl_max(node)
        return node unless node.right
        impl_max node.right
      end

      def impl_min(node)
        return node unless node.left
        impl_min node.left
      end

      def impl_delete_max(node)
        return node.left unless node.right
        node.right = impl_delete_max(node.right)
        node.size = computed_node_size(node)
        node
      end

      def impl_delete_min(node)
        return node.right unless node.left
        node.left = impl_delete_min(node.left)
        node.size = computed_node_size(node)
        node
      end

      def impl_put(node, key, value)
        return Node.new(key, value, 1) unless node
        comparison = key <=> node.key
        if comparison < 0
          node.left = impl_put(node.left, key, value)
        elsif comparison > 0
          node.right = impl_put(node.right, key, value)
        else
          node.value = value
        end
        node.size = computed_node_size(node)
        node
      end

      def impl_get(node, key)
        return unless node
        comparison = key <=> node.key
        if comparison < 0
          impl_get(node.left, key)
        elsif comparison > 0
          impl_get(node.right, key)
        else
          node.value
        end
      end

      def node_size(node)
        node.nil? ? 0 : node.size
      end

      def computed_node_size(node)
        1 + node_size(node.left) + node_size(node.right)
      end

      class Node
        attr_accessor :key, :value, :left, :right, :size

        def initialize(key = nil, value = nil, size = 0)
          @key = key
          @value = value
          @left = nil
          @right = nil
          @size = size
        end
      end
    end
  end
end
