require 'spec_helper'

describe Algorithmable::Sort do
  let(:fixture) { yaml_fixture 'sort/complex.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  it 'can sort unsorted array using merge sort' do
    expect(described_class.merge(collection)).to eq(sorted_collection)
  end

  it 'can return array with single element using merge sort' do
    input = [8]
    expect(described_class.merge(input)).to eq(input)
  end
end
