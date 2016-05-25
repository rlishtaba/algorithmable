module Algorithmable
  module Graphs
    module Traversals
      require 'algorithmable/graphs/traversals/errors'
      require 'algorithmable/graphs/traversals/depth_first'
      require 'algorithmable/graphs/traversals/breadth_first'
      require 'algorithmable/graphs/traversals/topological_sort'

      def traverse_with_depth_first(graph, source)
        DepthFirst.new(graph, source)
      end

      def traverse_with_breadth_first(graph, source)
        BreadthFirst.new(graph, source)
      end
    end
  end
end
