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

      def valid_vertex?(vertex)
        !(0 > vertex || vertex >= @vertices)
      end

      def degree(vertex)
        raise "Vertex #{vertex} is not valid." unless valid_vertex?(vertex)
        adjacency(vertex).size
      end

      def to_s
        data = ''
        @vertices.times do |vertex|
          data += "( #{vertex} => "
          @adj[vertex].each do |neighbor|
            data += "#{neighbor} "
          end
          data += ') '
        end
        "#<#{self.class} @vertices=#{@vertices} @edges=#{@edges} @data=#{data}>"
      end
    end
  end
end
