module Algorithmable
  module Graphs
    class Undirected
      attr_reader :vertices, :edges

      def initialize(vertices = 0)
        @vertices = vertices
        @edges = 0
        @adj = []
        @vertices.times { |i| @adj[i] = [] }
      end

      def add_edge(left_vertex, right_vertex)
        @adj[left_vertex] ||= []
        @adj[right_vertex] ||= []
        @adj[left_vertex].push right_vertex
        @adj[right_vertex].push left_vertex
        @edges = @edges.next
      end

      def adjacency(vertex)
        @adj[vertex]
      end
    end
  end
end
