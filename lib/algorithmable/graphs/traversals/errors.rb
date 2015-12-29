module Algorithmable
  module Graphs
    module Traversals
      module Errors
        TraversalError = Class.new RuntimeError
        UnvisitedVertexError = Class.new TraversalError
      end
    end
  end
end
