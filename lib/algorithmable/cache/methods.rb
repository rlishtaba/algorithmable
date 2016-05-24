module Algorithmable
  module Cache
    module Methods
      def clear
        @storage = {}
        @index = []
        self
      end

      def pop
        key = @index.delete @index.last
        @storage.delete key
      end
    end
  end
end
