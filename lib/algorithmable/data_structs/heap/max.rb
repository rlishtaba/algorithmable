module Algorithmable
  module DataStructs
    module Heap
      class Max < Imp
        def initialize(collection = [])
          super(collection) do |this, other|
            (this <=> other) < 0
          end
        end
      end
    end
  end
end
