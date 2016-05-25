require 'spec_helper'

describe Algorithmable::Sort do
  let(:fixture) { yaml_fixture 'sort/complex.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  context 'when sorting' do
    it 'can return ordered collection using binary_heap' do
      sorted = described_class.binary_heap(collection)
      expect(sorted).to eq(sorted_collection)
    end

    it 'should return ordered collection with negative values using binary_heap' do
      array = [-1, 0, -2, 10]
      expect(described_class.binary_heap array).to eq(array.sort)
    end

    it 'should return empty collection using binary_heap' do
      array = []
      expect(described_class.binary_heap array).to eq(array)
    end
  end
end
