require 'spec_helper'

describe Algorithmable::Puzzles::DijkstrasTwoStacks do
  context '#simple' do
    let(:puzzle) { described_class.new('( 1 + ( 2 * 3 ) )') }

    it do
      expect(puzzle.solve).to eq(7.0)
    end
  end

  context '#complex' do
    let(:puzzle) { described_class.new('( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) ) ') }

    it do
      expect(puzzle.solve).to eq(101.0)
    end
  end

  context '#extra complex' do
    let(:puzzle) { described_class.new('( ( 1 + sqrt ( 5 ) ) / 2.0 )') }

    it do
      expect(puzzle.solve).to eq(1.618033988749895)
    end
  end
end
