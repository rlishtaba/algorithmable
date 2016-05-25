require 'spec_helper'

describe Algorithmable::Sort do
  let(:fixture) { yaml_fixture 'sort/complex.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  it 'can sort unsorted array using quick sort' do
    expect(described_class.quick(collection)).to eq(sorted_collection)
  end

  it 'can sort 1000*1000 unsorted array using quick sort' do
    input = 1000.times.map { collection.shuffle }.flatten
    expect(described_class.quick(input).uniq).to eq(sorted_collection)
  end

  it 'can return array with single element using quick sort' do
    input = [8]
    expect(described_class.quick(input)).to eq(input)
  end
end
