require 'spec_helper'

describe Algorithmable::Cups::RootCubeIssue do
  it 'solve the problem using newton_approximation' do
    expect(described_class.newton_approximation(900_000_000)).to eq(965.4893846056298)
  end

  it 'solve the problem using binary_search' do
    expect(described_class.binary_search(900_000_000)).to eq(965.4893846056198)
  end
end
