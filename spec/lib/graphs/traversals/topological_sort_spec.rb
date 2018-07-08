require 'spec_helper'

describe Algorithmable::Graphs::Traversals::TopologicalSort do
  context 'additional DFS traversal test' do
    let(:graph) {
      Algorithmable::Graphs.new_directed_graph([[5, 2], [5, 0], [4, 0], [4, 1], [2, 3], [3, 1]])
    }
    it 'can sort DiGraph using topological sort algo' do
      sorted = described_class.sort(graph)
      expect(sorted).to eq([5, 4, 2, 3, 1, 0])
    end
  end
end
