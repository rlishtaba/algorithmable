require 'spec_helper'

describe Algorithmable::DataStructs::OrderedSymbolTable do
  let(:input) { %w(n y e c a q p b k t s v w f z j g r u m o i h l x).freeze }
  let(:tree) do
    new_tree = described_class.new(String, Numeric)
    input.each_with_index { |value, index| new_tree[value] = index }
    new_tree
  end

  context '#immutable' do
    it do
      expect(tree.size).to eq(input.size)
    end

    it do
      expect(tree).to be_kind_of(described_class)
    end

    it do
      expect(tree.max).to eq('z')
    end

    it do
      expect(tree.min).to eq('a')
    end

    it do
      expect(tree.key?('a')).to be_truthy
    end

    it do
      expect(tree['a']).to eq(input.index('a'))
    end

    it do
      expect(tree.floor('d')).to eq('c')
    end

    it do
      expect(tree.ceiling('d')).to eq('e')
    end

    it do
      key = 'f'
      expected_index = input.sort.index(key)
      expect(tree.rank(key)).to eq(expected_index)
    end

    it do
      keys = tree.keys
      expect(keys.to_a).to eq(input.sort)
    end
  end

  context '#mutable' do
    it do
      tree.delete('k')
      value = tree['k']
      expect(value).to be_nil
    end
  end
end
