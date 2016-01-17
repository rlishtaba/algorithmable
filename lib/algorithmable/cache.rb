module Algorithmable
  module Cache
    autoload :Imp, 'algorithmable/cache/imp'
    autoload :PrimitiveMinHeap, 'algorithmable/cache/primitive_min_heap'
    autoload :PrimitiveMaxHeap, 'algorithmable/cache/primitive_max_heap'

    def new_lru_cache(size, heap = PrimitiveMaxHeap.new)
      Imp.new size, heap
    end

    def new_mru_cache(size, heap = PrimitiveMinHeap.new)
      Imp.new size, heap
    end
  end
end
