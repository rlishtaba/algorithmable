require 'spec_helper'

describe Algorithmable::Graphs::Traversals::DepthFirst do
  context '#traversal' do
    let(:graph) do
      vertices = yaml_fixture('graphs/undirected/simple.yml')['vertices']
      Algorithmable::Graphs.new_undirected_graph(vertices)
    end

    let(:traversal) { described_class.new graph, 0 }

    it do
      expect(traversal.path_to(1)).to eq([0, 1])
    end

    it do
      expect(traversal.path_to(2)).to eq([0, 2])
    end

    it do
      expect(traversal.path_to(3)).to eq([0, 5, 4, 3])
    end

    it do
      expect(traversal.path_to(4)).to eq([0, 5, 4])
    end

    it do
      expect(traversal.path_to(5)).to eq([0, 5])
    end

    it do
      expect(traversal.path_to(6)).to eq([0, 5, 4, 6])
    end
  end
end
