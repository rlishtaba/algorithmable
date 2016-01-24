module Algorithmable
  module DataStructs
    module Tree
      class BinarySearch
        include Enumerable
        include Algorithmable::DataStructs

        def initialize(collection = [])
          @root = nil
          collection.each { |item| put item }
        end

        def height
          fail NotImplementedError
        end

        def size
          size_of @root
        end

        def empty?
          0 == size
        end

        def put(object)
          @root = put_impl @root, object
          self
        end

        def min
          return if empty?
          min_impl(@root).item
        end

        def max
          return if empty?
          max_impl(@root).item
        end

        def each(&block)
          each_with_dfs(&block)
        end

        def each_with_dfs(&block)
          tmp = collect_nodes_with_dfs(@root).to_a
          block_given? ? tmp.each(&block) : tmp
        end

        def each_with_bfs(&block)
          tmp = collect_nodes_with_bfs(@root).to_a
          block_given? ? tmp.each(&block) : tmp
        end

        def to_print
          return if empty?
          queue = new_fifo_queue
          level = 0
          next_level = 1
          out = []
          queue.enqueue @root
          until queue.empty?
            level += 1
            node = queue.dequeue
            out << node.item << ' '
            queue.enqueue node.left if node.left
            queue.enqueue node.right if node.right

            if level == next_level
              next_level += queue.size
              out << "\n"
            end
          end
          out.join
        end

        def reverse!
          @root = reverse_bang_impl @root
        end

        # def flip!
        #   queue = new_deque_queue
        #   current = @root
        #   until current.left.nil?
        #     queue.push_back current
        #     current = current.left
        #   end
        #
        #   root = queue.pop_front
        #   current = root
        #   until queue.empty?
        #     temp = queue.pop_back
        #     current.left = temp.right
        #     current.right = temp
        #     current = temp
        #   end
        #
        #   @root = root
        #   self
        # end

        def flip!
          @root = flip_bang_imp! @root, 0
        end

        def flip_bang_imp!(n, count)
          return unless n
          return n unless n.left && n.right
          new_head = flip_bang_imp! n.left, count + 1
          n.left.left = n.right
          n.left.right = n
          if count == 0
            n.left = nil
            n.right = nil
          end
          new_head
        end

        private

        def reverse_bang_impl(root)
          return unless root
          reverse_bang_impl root.left
          reverse_bang_impl root.right
          tmp = root.left
          root.left = root.right
          root.right = tmp
          root
        end

        def collect_nodes_with_bfs(root)
          queue = new_fifo_queue
          stack = new_lifo_queue
          queue.enqueue root
          until queue.empty?
            node = queue.dequeue
            stack.push node.item
            queue.enqueue node.left if node.left
            queue.enqueue node.right if node.right
          end
          stack
        end

        def collect_nodes_with_dfs(node)
          stack = []
          dfs_impl node, stack
          stack
        end

        # in-order traversal
        def dfs_impl(node, stack)
          dfs_impl node.left, stack if node.left
          stack.push node.item
          dfs_impl node.right, stack if node.right
        end

        def max_impl(node)
          return node if node.right.nil?
          max_impl(node.right)
        end

        def min_impl(node)
          return node if node.left.nil?
          min_impl(node.left)
        end

        def put_impl(node, object)
          return make_node(object, 1) unless node
          case object <=> node.item
            when -1
              node.left = put_impl(node.left, object)
            when 1
              node.right = put_impl(node.right, object)
            else
              node.item = object
          end
          node.size = 1 + size_of(node.left) + size_of(node.right)
          node
        end

        def size_of(node)
          return 0 if node.nil?
          node.size
        end

        def make_node(object, size)
          Node.new object, size
        end

        class Node
          attr_accessor :item, :left, :right, :size

          def initialize(value, size)
            @item = value
            @size = size
            @left = nil
            @right = nil
          end

          def <=>(other)
            @item <=> other.item
          end
        end

        private_constant :Node
      end
    end
  end
end
