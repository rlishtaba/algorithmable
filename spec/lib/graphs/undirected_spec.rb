require 'spec_helper'

describe Algorithmable::Graphs::Undirected do
  context '#constructor' do
    it do
      expect(described_class.new).to be_a_kind_of(described_class)
    end

    it do
      expect(described_class.new(13)).to be_a_kind_of(described_class)
    end
  end

  context '#edges' do
    let(:graph) { described_class.new 2 }

    it do
      expect(graph.edges).to eq(0)
    end

    it do
      graph.add_edge(0, 2)
      expect(graph.edges).to eq(1)
    end

    it do
      graph.add_edge(0, 1)
      graph.add_edge(0, 2)
      expect(graph.edges).to eq(2)
    end

    it do
      graph.add_edge(1, 0)
      graph.add_edge(1, 3)
      expect(graph.adjacency(1)).to eq([0, 3])
    end
  end
end
