require 'spec_helper'

describe Algorithmable::Sort do
  let(:fixture) { yaml_fixture 'sort/simple.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  it 'can sort unsorted array' do
    expect(described_class.shell(collection)).to eq(sorted_collection)
  end

  it 'can return array with single element' do
    input = [8]
    expect(described_class.shell(input)).to eq(input)
  end
end
