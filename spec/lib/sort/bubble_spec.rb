require 'spec_helper'

describe Algorithmable::Sort::Bubble do
  it 'can sort unsorted array' do
    input = [8, 7, 6, 9, 4, 3, 0, 1]
    result = [0, 1, 3, 4, 6, 7, 8, 9]
    expect(described_class.sort(*input)).to eq(result)
  end

  it 'can sort unsorted large array' do
    array = [8, 7, 6, 9, 4, 3, 0, 1]
    input = 10.times.map { array.shuffle }.flatten
    result = [0, 1, 3, 4, 6, 7, 8, 9]
    expect(described_class.sort(*input).uniq).to eq(result)
  end

  it 'can return array with single element' do
    input = [8]
    expect(described_class.sort(*input)).to eq(input)
  end
end
