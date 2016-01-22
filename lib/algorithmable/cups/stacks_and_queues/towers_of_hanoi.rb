module Algorithmable
  module Cups
    module StacksAndQueues
      module TowersOfHanoi
        class Tower
          include Algorithmable::DataStructs

          attr_reader :index

          def initialize(index)
            @disks = new_lifo_queue
            @index = index
          end

          def add(disk)
            fail "Error placing disk #{disk} on #{@disks.peek}." if !@disks.empty? && @disks.peek <= disk
            @disks.push disk
          end

          def move_top_to_tower(other_tower)
            top = @disks.pop
            debug "Moving #{top} from #{index} to #{other_tower.index}."
            other_tower.add top
          end

          def move_disks(amount, destination, buffer)
            return unless amount > 0
            move_disks amount - 1, buffer, destination
            move_top_to_tower destination
            buffer.move_disks amount - 1, destination, self
          end

          def inspect
            "#<Tower ##{index} #{@disks.to_s}>"
          end

          def to_a
            @disks.to_a
          end

          def debug(message)
            puts message
          end
        end
      end
    end
  end
end
