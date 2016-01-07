require 'spec_helper'

describe Algorithmable::Sort::Bubble do
  let(:fixture) { yaml_fixture 'sort/simple.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  it 'can sort unsorted array' do
    expect(described_class.sort(collection)).to eq(sorted_collection)
  end

  it 'can sort unsorted large array' do
    input = 10.times.map { collection.shuffle }.flatten
    expect(described_class.sort(input).uniq).to eq(sorted_collection)
  end

  it 'can return array with single element' do
    input = [8]
    expect(described_class.sort(input)).to eq(input)
  end
end
