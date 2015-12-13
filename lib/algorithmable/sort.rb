module Algorithmable
  module Sort
    autoload :Merge, 'algorithmable/sort/merge'
    autoload :Bubble, 'algorithmable/sort/bubble'

    class << self
      def merge(*items)
        Merge.sort(*items)
      end

      def bubble(*items)
        Bubble.sort(*items)
      end
    end
  end
end
