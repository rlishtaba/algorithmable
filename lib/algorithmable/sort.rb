module Algorithmable
  module Sort
    autoload :Merge, 'algorithmable/sort/merge'
    autoload :Bubble, 'algorithmable/sort/bubble'

    class << self
      def merge(collection)
        Merge.sort(collection)
      end

      def bubble(collection)
        Bubble.sort(collection)
      end
    end
  end
end
