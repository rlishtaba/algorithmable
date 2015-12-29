module Algorithmable
  module Graphs
    module Traversals
      autoload :Errors, 'algorithmable/graphs/traversals/errors'
      autoload :DepthFirst, 'algorithmable/graphs/traversals/depth_first'
      autoload :BreathFirst, 'algorithmable/graphs/traversals/breath_first'

      def traverse_with_depth_first(graph, source)
        DepthFirst.new(graph, source)
      end
    end
  end
end
