require 'spec_helper'

describe Algorithmable::Graphs do
  context '#general' do
    it do
      expect(
        described_class.new_undirected_graph
      ).to be_a_kind_of(Algorithmable::Graphs::Undirected)
    end

    it do
      vertices = [[0, 1], [0, 2]]
      expect(
        described_class.new_undirected_graph(vertices)
      ).to be_a_kind_of(Algorithmable::Graphs::Undirected)
    end
  end
end
