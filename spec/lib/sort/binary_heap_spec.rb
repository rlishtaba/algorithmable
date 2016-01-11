require 'spec_helper'

describe Algorithmable::Sort::BinaryHeap do
  let(:fixture) { yaml_fixture 'sort/simple.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  context 'when sorting' do
    it 'can return ordered collection' do
      sorted = described_class.sort(collection)
      expect(sorted).to eq(sorted_collection)
    end

    it 'should return ordered collection with negative values' do
      array = [-1, 0, -2, 10]
      expect(described_class.sort array).to eq(array.sort)
    end

    it 'should return empty collection' do
      array = []
      expect(described_class.sort array).to eq(array)
    end
  end
end
