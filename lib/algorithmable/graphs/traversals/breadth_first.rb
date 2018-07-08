require 'thread'
module Algorithmable
  module Graphs
    module Traversals
      class BreadthFirst
        include Algorithmable::Graphs::Traversals::Errors

        def initialize(graph, source, &f)
          vertices_size = graph.vertices.size
          @visited = Array.new(vertices_size - 1)
          @edge_to = Array.new(vertices_size - 1)
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

        def traverse(graph, vertex)
          queue = ::Queue.new
          @visited[vertex] = true
          queue.enq vertex
          yield vertex if block_given?
          until queue.empty?
            next_vertex = queue.deq
            graph.adjacency_list(next_vertex).each do |neighbour_vertex|
              next if visited? neighbour_vertex
              @edge_to[neighbour_vertex] = next_vertex
              @visited[neighbour_vertex] = true
              queue.enq neighbour_vertex
              yield neighbour_vertex if block_given?
            end
          end
        end
      end
    end
  end
end
