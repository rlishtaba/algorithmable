require 'spec_helper'

describe Algorithmable::DataStructs::Queue do
  context '#general' do
    let(:queue) { described_class.new }
    let(:items) { [3, 2, 1].freeze }

    it do
      expect(queue).to be_kind_of(described_class)
    end

    it do
      queue.enqueue 1
      expect(queue.size).to eq(1)
    end

    it do
      items.each { |item| queue.enqueue item }
      expect(queue.peek).to eq(3)
    end

    it do
      items.each { |item| queue.enqueue item }
      expect(queue.dequeue).to eq(3)
    end

    it do
      expect { queue.peek }.to raise_error(Algorithmable::Errors::NoSuchElementError)
    end

    it do
      expect { queue.dequeue }.to raise_error(Algorithmable::Errors::NoSuchElementError)
    end

    it do
      items.each { |item| queue.enqueue item }
      expected_items = queue.size.times.collect { queue.dequeue }
      expect(expected_items).to eq(items)
    end

    it do
      items.each { |item| queue.enqueue item }
      string = queue.map(&:to_s).join(':')
      expect(string).to eq(items.join(':'))
    end
  end
end
