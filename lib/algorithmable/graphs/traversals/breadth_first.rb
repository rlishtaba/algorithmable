require 'thread'
module Algorithmable
  module Graphs
    module Traversals
      class BreadthFirst
        include Algorithmable::Graphs::Traversals::Errors

        def initialize(graph, source)
          vertices_size = graph.vertices.size
          @visited = Array.new(vertices_size - 1)
          @edge_to = Array.new(vertices_size - 1)
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
          queue = ::Queue.new
          @visited[vertex] = true
          queue.enq vertex
          until queue.empty?
            next_vertex = queue.deq
            graph.adjacency(next_vertex).each do |neighbour_vertex|
              unless visited? neighbour_vertex
                @edge_to[neighbour_vertex] = next_vertex
                @visited[neighbour_vertex] = true
                queue.enq neighbour_vertex
              end
            end
          end
        end
      end
    end
  end
end
