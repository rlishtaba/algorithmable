require 'spec_helper'

describe Algorithmable::DataStructs::Deque do
  context '#when testing Deque as LIFO' do
    let(:container) { described_class.new }
    let(:items) { [1, 2, 3].freeze }

    it do
      expect(container).to be_kind_of(described_class)
    end

    it do
      container.push_front 1
      container.push_front 2
      expect(container.size).to eq(2)
    end

    it 'can return front peek value' do
      items.each { |item| container.push_front item }
      expect(container.peek_front).to eq(3)
    end

    it 'can return front value enqueued last' do
      items.each { |item| container.push_front item }
      expect(container.pop_front).to eq(3)
    end

    it do
      expect(container.peek_front).to be_nil
    end

    it do
      expect { container.pop_front }.to raise_error(described_class::NoSuchElementError)
    end

    it do
      items.each { |item| container.push_front item }
      expected_items = container.size.times.collect { container.pop_front }
      expect(expected_items).to eq(items.reverse)
    end

    it do
      items.each { |item| container.push_front item }
      local_items = []
      container.reverse_each { |item| local_items << item }
      expect(local_items.join(':')).to eq(items.join(':'))
    end
  end

  context '#when testing Deque as FIFO' do
    let(:container) { described_class.new }
    let(:items) { [1, 2, 3].freeze }

    it do
      expect(container).to be_kind_of(described_class)
    end

    it do
      container.push_back 1
      container.push_back 2
      expect(container.size).to eq(2)
    end

    it 'can pop first out' do
      items.each { |item| container.push_back item }
      expect(container.peek_front).to eq(1)
    end

    it 'can return front peek value' do
      items.each { |item| container.push_back item }
      expect(container.peek_front).to eq(1)
    end

    it 'can return front value enqueued lat' do
      items.each { |item| container.push_back item }
      expect(container.pop_back).to eq(3)
    end

    it do
      expect(container.peek_front).to be_nil
    end

    it do
      expect { container.pop_front }.to raise_error(described_class::NoSuchElementError)
    end

    it do
      items.each { |item| container.push_back item }
      expected_items = container.size.times.collect { container.pop_front }
      expect(expected_items).to eq(items)
    end

    it do
      items.each { |item| container.push_back item }
      expect(container.map(&:to_s).join(':')).to eq(items.join(':'))
    end
  end
end
