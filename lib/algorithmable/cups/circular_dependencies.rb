module Algorithmable
  module Cups
    module CircularDependencies
      def lib_dependencies(item, dependencies)
        visited = []
        dfs(item, dependencies, visited) do |entry, dep|
          puts "circular dependency: #{entry} <=> #{dep}"
        end
        visited
      end

      def dfs(item, dependencies, visited, &block)
        next_items = dependencies[item]
        return [] unless next_items
        visited << item

        next_items.each do |dep|
          if visited.include? dep
            yield item, dep if block_given?
            next
          end
          dfs(dep, dependencies, visited, &block)
        end
      end
    end
  end
end
