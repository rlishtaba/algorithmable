module Algorithmable
  module Graphs
    class Undirected
      attr_reader :vertices, :edges

      def initialize(vertices = 0)
        @vertices = vertices
        @edges = 0
        @adjacency_list = []
        @vertices.times { |i| @adjacency_list[i] = [] }
      end

      def add_edge(left_vertex, right_vertex)
        @adjacency_list[left_vertex] ||= []
        @adjacency_list[right_vertex] ||= []
        @adjacency_list[left_vertex].push right_vertex
        @adjacency_list[right_vertex].push left_vertex
        @edges = @edges.next
      end

      def adjacency_list(vertex)
        @adjacency_list[vertex]
      end

      def valid_vertex?(vertex)
        !(0 > vertex || vertex >= @vertices)
      end

      def degree(vertex)
        fail "Vertex #{vertex} is not valid." unless valid_vertex?(vertex)
        adjacency_list(vertex).size
      end

      def to_s
        data = ''
        @vertices.times do |vertex|
          data += "( #{vertex} => "
          @adjacency_list[vertex].each do |neighbor|
            data += "#{neighbor} "
          end
          data += ') '
        end
        "#<#{self.class} @vertices=#{@vertices} @edges=#{@edges} @data=#{data}>"
      end
    end
  end
end
