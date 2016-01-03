module Algorithmable
  module Puzzles
    class DijkstrasTwoStacks
      include Algorithmable::DataStructs

      MATH_OPS = %w(sqrt cos sin tan atan2 log log2 log10)
      ARITHMETICAL_OPS = %w(+ - * /)
      OPS = ARITHMETICAL_OPS + MATH_OPS
      OPEN_EXP = '('
      CLOSE_EXP = ')'

      def initialize(expression)
        @expression = expression
      end

      def solve
        operations = new_lifo_queue
        values = new_lifo_queue
        parse_expression(operations, values)
        values.pop
      end

      private

      def parse_expression(operations, values)
        @expression.split.each do |char|
          if OPEN_EXP == char
            #noop
          elsif OPS.include?(char)
            operations.push char
          elsif CLOSE_EXP == char
            operation = operations.pop
            value = values.pop
            compute operation, value, values
          else
            values.push Float(char)
          end
        end
      end

      def compute(operation, value, values_stack)
        if MATH_OPS.include? operation
          values_stack.push Math.send(operation, value)
        else
          values_stack.push values_stack.pop.send(operation, value)
        end
      end
    end
  end
end
