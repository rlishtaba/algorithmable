module Algorithmable
  module Graphs
    module Traversals
      autoload :Errors, 'algorithmable/graphs/traversals/errors'
      autoload :DepthFirst, 'algorithmable/graphs/traversals/depth_first'
      autoload :BreadthFirst, 'algorithmable/graphs/traversals/breadth_first'

      def traverse_with_depth_first(graph, source)
        DepthFirst.new(graph, source)
      end

      def traverse_with_breadth_first(graph, source)
        BreadthFirst.new(graph, source)
      end
    end
  end
end
