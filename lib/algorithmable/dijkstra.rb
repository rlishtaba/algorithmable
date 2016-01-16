module Algorithmable
  class Algorithm
    include Algorithmable::DataStructs
    INFINITY = 1 << 32

    def self.dijkstra(source, edges, weights, n)
      visited = Array.new(n, false)
      previous = Array.new(n, nil)
      shortest_distances = Array.new(n, INFINITY)

      # pq = PQueue.new(proc { |x, y| shortest_distances[x] < shortest_distances[y] })

      pq = new_priority_queue(source) do |x, y|
        shortest_distances[x] < shortest_distances[y]
      end

      # pq.push(source)
      visited[source] = true
      shortest_distances[source] = 0

      while pq.size != 0
        v = pq.pop
        visited[v] = true
        if edges[v]
          edges[v].each do |w|
            if !visited[w] && shortest_distances[w] > (shortest_distances[v] + weights[v][w])
              shortest_distances[w] = (shortest_distances[v] + weights[v][w])
              previous[w] = v
              pq.push(w)
            end
          end
        end
      end

      [shortest_distances, previous]
    end
  end
end
