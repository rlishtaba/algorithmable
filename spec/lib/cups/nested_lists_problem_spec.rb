require 'spec_helper'

describe Algorithmable::Cups::NestedListsProblem do
  let(:factory) { Object.new.extend Algorithmable::Cups::NestedListsProblem }

  it do
    list = factory.make_list [1, [2, 3, [5]], 4]
    result = factory.solve_puzzle list
    expected = (1 * 1) + (2 * 2) + (3 * 2) + (5 * 3) + (4 * 1)
    expect(result).to eq(expected)
  end

  it do
    list = factory.make_list [1, [2, 3, [5, 6, 7, [8, [9, [10, [11, [12, [13]]]]]]]], 4]
    result = factory.solve_puzzle list
    expected = 496
    expect(result).to eq(expected)
  end
end
