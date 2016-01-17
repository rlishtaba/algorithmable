require 'spec_helper'

describe Algorithmable::Puzzles do
  let(:factory) do
    Object.new.extend Algorithmable::Puzzles
  end

  context 'when solving puzzles' do
    it 'can solve josephus problem' do
      puzzle = factory.new_josephus_problem 7, 2
      expect(puzzle.solve).to eq([1, 3, 5, 0, 4, 2, 6])
    end
  end
end
