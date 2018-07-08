module Algorithmable
  module Graphs
    class Edge
      attr_reader :from, :to, :weight

      def initialize(from, to, weight)
        @from = from
        @to = to
        @weight = weight
        freeze
      end
    end
  end
end
