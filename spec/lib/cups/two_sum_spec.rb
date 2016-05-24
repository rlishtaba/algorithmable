require 'spec_helper'

describe Algorithmable::Cups::TwoSum do
  include Algorithmable::Cups::TwoSum
  context 'quadratic solution'
  it do
    collection = [2, 7, 11, 15]
    solver = new_quadratic_solution
    expect(solver.solve collection, 9).to eq(0 => 2, 1 => 7)
  end

  it do
    collection = [2, 7, 11, 15]
    solver = new_quadratic_solution
    expect(solver.solve collection, 22).to eq(1 => 7, 3 => 15)
  end
end
