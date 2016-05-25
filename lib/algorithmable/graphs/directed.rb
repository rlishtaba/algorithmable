module Algorithmable
  module Graphs
    class Directed
      def initialize
        @edges = 0
        @incoming_degree = []
        @adjacency_list = []
      end

      def add_edge(edge)
        from = edge.from
        to = edge.to
        validate_vertex(to)
        validate_vertex(from)
        (@adjacency_list[from] ||= [])
            .tap { |xs| xs << edge }
        (@incoming_degree[to] ||= 0)
            .tap { @incoming_degree[to] += 1 }
        @edges += 1
      end

      def adjacency_list(vertex)
        @adjacency_list[vertex] || []
      end

      def out_degree(vertex)
        @adjacency_list[vertex].length
      end

      def in_degree(vertex)
        @incoming_degree[vertex]
      end

      def edges
        @adjacency_list.dup
      end

      private

      def validate_vertex(value)
        raise "invalid vertex value: #{value}" if 0 > value
      end
    end
  end
end
