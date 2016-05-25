module Algorithmable
  module Graphs
    require 'algorithmable/graphs/directed'
    require 'algorithmable/graphs/edge'
    require 'algorithmable/graphs/traversals'
    require 'algorithmable/graphs/undirected'

    class << self
      def new_undirected_graph(vertices = [])
        graph = Undirected.new(vertices.size)
        vertices.each do |left, right|
          graph.add_edge left, right
        end
        graph
      end

      def new_directed_graph(vertices = [])
        Directed.new.tap do |g|
          vertices.each do |from, to, weight|
            g.add_edge Edge.new(from, to, weight)
          end
        end
      end
    end
  end
end
