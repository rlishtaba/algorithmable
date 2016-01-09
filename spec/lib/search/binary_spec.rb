require 'spec_helper'

describe Algorithmable::Searches::BinarySearch do
  context '# when searching chars' do
    let(:alphabet) { ('a'..'z').to_a.freeze }

    it do
      letter = 'a'
      index = 0
      expect(described_class.lookup(letter, alphabet)).to eq(index)
    end

    it do
      letter = 'b'
      index = 1
      expect(described_class.lookup(letter, alphabet)).to eq(index)
    end

    it do
      letter = 'k'
      index = 10
      expect(described_class.lookup(letter, alphabet)).to eq(index)
    end

    it do
      letter = 'y'
      index = 24
      expect(described_class.lookup(letter, alphabet)).to eq(index)
    end

    it do
      letter = 'z'
      index = 25
      expect(described_class.lookup(letter, alphabet)).to eq(index)
    end
  end
end
