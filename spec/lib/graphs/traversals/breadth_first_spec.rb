require 'spec_helper'

describe Algorithmable::Graphs::Traversals::BreadthFirst do
  context '#traversal' do
    let(:graph) do
      vertices = yaml_fixture('graphs/undirected/simple.yml')['vertices']
      Algorithmable::Graphs.new_undirected_graph(vertices)
    end

    let(:traversal) { described_class.new graph, 0 }

    it do
      expect(traversal.path_to(1)).to eq([1, 0])
    end

    it do
      expect(traversal.path_to(2)).to eq([2, 0])
    end

    it do
      expect(traversal.path_to(3)).to eq([3, 5, 0])
    end

    it do
      expect(traversal.path_to(4)).to eq([4, 5, 0])
    end

    it do
      expect(traversal.path_to(5)).to eq([5, 0])
    end

    it do
      expect(traversal.path_to(6)).to eq([6, 0])
    end
  end
end
