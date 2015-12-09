module Algorithmable
  module Sort
    autoload :Merge, 'algorithmable/sort/merge'

    class << self
      def merge(*items)
        Merge.sort(*items)
      end
    end
  end
end
