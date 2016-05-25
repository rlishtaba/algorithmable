module Algorithmable
  module Graphs
    module Traversals
      class DepthFirst
        include Algorithmable::Graphs::Traversals::Errors

        def initialize(graph, source, &f)
          @visited = []
          @edge_to = []
          @source = source
          traverse graph, source, &f
        end

        def visited?(vertex)
          @visited[vertex]
        end

        def path_to(vertex)
          fail UnvisitedVertexError, vertex unless visited?(vertex)
          path = []
          finish = vertex
          while finish != @source
            path.unshift finish
            finish = @edge_to[finish]
          end
          path.unshift @source
          path
        end

        private

        def traverse(graph, vertex, &f)
          @visited[vertex] = true
          yield vertex if block_given?
          graph.adjacency_list(vertex).each do |neighbour_vertex|
            unless visited? neighbour_vertex
              @edge_to[neighbour_vertex] = vertex
              traverse graph, neighbour_vertex, &f
            end
          end
        end
      end
    end
  end
end
