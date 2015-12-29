module Algorithmable
  module Graphs
    autoload :Undirected, 'algorithmable/graphs/undirected'
    autoload :Traversals, 'algorithmable/graphs/traversals'

    class << self
      def new_undirected_graph(vertices = [])
        graph = Undirected.new(vertices.size)
        vertices.each do |left, right|
          graph.add_edge left, right
        end
        graph
      end
    end
  end
end
