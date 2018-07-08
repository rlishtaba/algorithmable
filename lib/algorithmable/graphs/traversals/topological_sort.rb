module Algorithmable
  module Graphs
    module Traversals
      class TopologicalSort
        include Algorithmable::Graphs::Traversals::Errors

        def self.sort(graph, &f)
          stack = []
          visited = []
          graph.edges.each_index do |i|
            next if visited[i]
            do_sort(graph, i, stack, visited, &f)
          end
          stack
        end

        def self.do_sort(graph, vertex, stack, visited, &f)
          visited[vertex] = true
          graph.adjacency_list(vertex).each do |edge|
            next if visited[edge.to]
            do_sort graph, edge.to, stack, visited, &f
          end
          yield vertex if block_given?
          stack.unshift vertex
        end

        private_class_method :do_sort
      end
    end
  end
end
