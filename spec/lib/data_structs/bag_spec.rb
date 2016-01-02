require 'spec_helper'

describe Algorithmable::DataStructs::Bag do
  context '#general' do
    let(:bag) { described_class.new }

    it do
      expect(bag).to be_kind_of(described_class)
    end

    it do
      bag.add 1
      expect(bag.size).to eq(1)
    end

    it do
      [3, 2, 1].each { |item| bag.add item }
      expect(bag.first.item).to eq(1)
    end

    it do
      [3, 2, 1].each { |item| bag.add item }
      expect(bag.size).to eq(3)
    end

    it do
      expect(bag.first).to eq(nil)
    end

    it do
      [3, 2, 1].each { |item| bag.add item }
      yielded = bag.collect { |i| i.item }
      expect(yielded).to eq([3, 2, 1].reverse)
    end
  end
end
