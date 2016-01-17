require 'spec_helper'

describe Algorithmable::Searches do
  context '#when factoring new objects' do
    let(:factory) do
      Object.new.extend Algorithmable::Searches
    end

    it do
      search = factory.binary_search(1, [2, 4, 5, 1].sort)
      expect(search).to eq(0)
    end

    it do
      tree = factory.new_binary_search_tree(String, Fixnum)
      expect(tree).to be_kind_of described_class::BinarySearchTree
    end
  end
end
