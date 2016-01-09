module Algorithmable
  module Search
    autoload :Binary, 'algorithmable/search/binary'

    class << self
      def binary(element, collection)
        Binary.lookup(element, collection)
      end
    end
  end
end
