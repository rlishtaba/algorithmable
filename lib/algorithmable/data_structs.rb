module Algorithmable
  module DataStructs
    autoload :Bag, 'algorithmable/data_structs/bag'
    autoload :LinkedList, 'algorithmable/data_structs/linked_list'

    class << self
      def new_bag
        Bag.new
      end
    end
  end
end
