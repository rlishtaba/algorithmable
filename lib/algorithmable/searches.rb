module Algorithmable
  module Searches
    autoload :BinarySearch, 'algorithmable/search/binary_search'

    def binary_search(element, collection)
      BinarySearch.lookup(element, collection)
    end
  end
end
