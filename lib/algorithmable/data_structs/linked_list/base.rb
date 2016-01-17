module Algorithmable
  module DataStructs
    module LinkedList
      class Base
        attr_reader :size, :front

        def initialize(collection = [])
          @front = nil
          @back = nil
          @size = 0
          collection.each { |item| push_front item }
        end

        def empty?
          0 == size
        end

        def clear!
          @front = nil
          @back = nil
          @size = 0
        end

        def peek_front
          @front && @front.item
        end

        def peek_back
          @back && @back.item
        end

        def include?(item)
          !search(item).nil?
        end

        def push_back(_item)
          fail NotImplementedError
        end

        def push_front(_item)
          fail NotImplementedError
        end

        def pop_back
          fail NotImplementedError
        end

        def pop_front
          fail NotImplementedError
        end

        def delete(_item)
          fail NotImplementedError
        end

        def reverse
          fail NotImplementedError
        end

        def merge(_other_list)
          fail NotImplementedError
        end

        private

        def search(item)
          return if empty?
          node = @front
          while node
            break if node.item == item
            node = node.next
          end
          node
        end

        def each(&block)
          nodes = []
          node = @front
          until node.nil?
            nodes << node
            node = node.next
          end
          nodes.each(&block)
        end

        def new_node(_item, *_args)
          fail NotImplementedError
        end
      end
    end
  end
end
