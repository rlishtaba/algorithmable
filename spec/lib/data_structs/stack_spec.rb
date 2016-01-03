require 'spec_helper'

describe Algorithmable::DataStructs::Stack do
  context '#general' do
    let(:stack) { described_class.new }
    let(:items) { [3, 2, 1].freeze }

    it do
      expect(stack).to be_kind_of(described_class)
    end

    it do
      stack.push 1
      expect(stack.size).to eq(1)
    end

    it do
      items.each { |item| stack.push item }
      expect(stack.peek).to eq(1)
    end

    it do
      items.each { |item| stack.push item }
      expect(stack.pop).to eq(1)
    end

    it do
      expect { stack.peek }.to raise_error(Algorithmable::DataStructs::Stack::NoSuchElementError)
    end

    it do
      expect { stack.pop }.to raise_error(Algorithmable::DataStructs::Stack::NoSuchElementError)
    end

    it do
      items.each { |item| stack.push item }
      expected_items = stack.size.times.collect { stack.pop }
      expect(expected_items).to eq(items.reverse)
    end

    it do
      items.each { |item| stack.push item }
      expect(stack.to_s).to eq(items.reverse.join(described_class::SEPARATOR))
    end
  end
end
