require 'spec_helper'

describe Algorithmable::Sort::BinaryHeap do
  let(:fixture) { yaml_fixture 'sort/simple.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  it do
    expect(described_class.sort collection).to eq(sorted_collection)
  end
end
