require 'spec_helper'

describe Algorithmable::Cups::LongestCommonSubSequence do
  it 'can find longest common sub-sequence in two strings' do
    a = 'aaaaabbbb34354354345'
    b = 'abbb34aaabbbb'
    solver = described_class.new
    expect(solver.find(a, b)).to eq('aaaabbbb')
  end
end
