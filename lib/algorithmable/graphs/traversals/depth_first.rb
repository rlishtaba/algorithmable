module Algorithmable
  module Graphs
    module Traversals
      class DepthFirst
        include Algorithmable::Graphs::Traversals::Errors

        def initialize(graph, source)
          @visited = []
          @edge_to = []
          @source = source
          traverse graph, source
        end

        def visited?(vertex)
          @visited[vertex]
        end

        def path_to(vertex)
          fail UnvisitedVertexError, vertex unless visited?(vertex)
          path = []
          finish = vertex
          while finish != @source
            path.push finish
            finish = @edge_to[finish]
          end
          path.push @source
          path
        end

        private

        def traverse(graph, vertex)
          @visited[vertex] = true
          graph.adjacency(vertex).each do |neighbour_vertex|
            unless visited? neighbour_vertex
              @edge_to[neighbour_vertex] = vertex
              traverse graph, neighbour_vertex
            end
          end
        end
      end
    end
  end
end
