require 'spec_helper'

describe Algorithmable::DataStructs::Deque do
  let(:container) { described_class.new }
  let(:items) { [1, 2, 3].freeze }

  it 'can instantiate Deque type' do
    expect(container).to be_kind_of(described_class)
  end

  context '#when testing Deque as LIFO' do
    it 'can return proper size' do
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

    it 'can handle non existing front peek value' do
      expect(container.peek_front).to be_nil
    end

    it 'can raise an exception of expected type' do
      expect { container.pop_front }.to raise_error(described_class::NoSuchElementError)
    end

    it 'can pop expected items' do
      items.each { |item| container.push_front item }
      expected_items = container.size.times.collect { container.pop_front }
      expect(expected_items).to eq(items.reverse)
    end

    it 'can iterate in reverse order' do
      items.each { |item| container.push_front item }
      local_items = []
      container.reverse_each { |item| local_items << item }
      expect(local_items.join(':')).to eq(items.join(':'))
    end
  end

  context '#when testing Deque as FIFO' do

    it 'can push back to deque' do
      container.push_back 1
      container.push_back 2
      expect(container.size).to eq(2)
    end

    it 'can return front peek value' do
      items.each { |item| container.push_back item }
      expect(container.peek_front).to eq(1)
    end

    it 'can pop front peek value' do
      items.each { |item| container.push_back item }
      expect(container.pop_front).to eq(1)
    end

    it 'can handle non existing front peek value' do
      expect(container.peek_front).to be_nil
    end

    it 'can raise an exception of expected type' do
      expect { container.pop_front }.to raise_error(described_class::NoSuchElementError)
    end

    it 'can yield expected items in forward order' do
      items.each { |item| container.push_back item }
      expected_items = container.size.times.collect { container.pop_front }
      expect(expected_items).to eq(items)
    end

    it 'can iterate in forward order' do
      items.each { |item| container.push_back item }
      expect(container.map(&:to_s).join(':')).to eq(items.join(':'))
    end
  end
end
