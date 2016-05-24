require 'spec_helper'

describe Algorithmable::DataStructs::LinkedList::Doubly do
  context '#general' do
    let(:list) { described_class.new }

    it do
      expect(list.empty?).to be_truthy
    end

    it do
      expect(list).to be_kind_of(described_class)
    end

    it do
      [1, 2].each { |i| list.push_front i }
      expect(list.size).to eq(2)
    end

    it do
      [3, 2, 1].each { |item| list.push_front item }
      expect(list.peek_front).to eq(1)
    end

    it do
      [3, 2, 1].each { |item| list.push_front item }
      expect(list.peek_back).to eq(3)
    end

    it do
      [1, 2].each { |i| list.push_front i }
      expect(list.include? 1).to eq(true)
    end

    it do
      expect(list.peek_back).to be_nil
    end

    it do
      expect(list.peek_front).to be_nil
    end

    it do
      [1, 2, 3].each { |item| list.push_front item }
      expect(list.size).to eq(3)
    end

    it do
      [1, 2, 3].each { |item| list.push_front item }
      list.delete 3
      expect(list.peek_front).to eq(2)
      expect(list.peek_back).to eq(1)
      expect(list.size).to eq(2)
    end

    it do
      [1, 2, 3].each { |item| list.push_front item }
      list.delete 2
      expect(list.peek_front).to eq(3)
      expect(list.peek_back).to eq(1)
      expect(list.size).to eq(2)
    end

    it do
      list.push_front 3
      list.delete 3
      expect(list.peek_front).to eq(nil)
      expect(list.peek_back).to eq(nil)
      expect(list.size).to eq(0)
    end

    it do
      [1, 2, 3].each { |item| list.push_front item }
      list.delete 3
      list.delete 1
      expect(list.peek_front).to eq(2)
      expect(list.peek_back).to eq(2)
      expect(list.size).to eq(1)
    end

    it do
      [1, 2, 3].each { |item| list.push_front item }
      list.delete 3
      list.delete 1
      list.delete 2
      expect(list.peek_front).to be_nil
      expect(list.peek_back).to be_nil
      expect(list.size).to eq(0)
    end

    it do
      [1, 2, 3].each { |item| list.push_front item }
      list.delete 1
      expect(list.peek_front).to eq(3)
      expect(list.peek_back).to eq(2)
    end

    # it 'can find merge node in a sorted linked list' do
    #   a_collection = [1, 3, 5, 7, 9]
    #   b_collection = [2, 4, 6, 8, 10]
    #   left = described_class.new a_collection
    #   right = described_class.new b_collection
    #   expect(left.find_merge_node(right)).to eq(2)
    # end
    #

    # it 'can merge sorted linked lists' do
    #   a_collection = [1, 3, 5, 7, 9]
    #   b_collection = [2, 4, 6, 8, 10]
    #   left = described_class.new a_collection
    #   right = described_class.new b_collection
    #   expect(described_class.merge(right, left)).to eq(2)
    # end
  end

  context '#pop front' do
    let(:collection) { [1, 2, 3] }
    let(:list) { described_class.new }

    before :each do
      list.clear!
      collection.each { |item| list.push_front item }
    end

    it do
      value = list.pop_front
      expect(value).to eq(3)
    end

    it do
      buffer = []
      list.size.times { buffer << list.pop_front }
      expect(buffer).to eq(collection.reverse)
    end

    it do
      list.size.times { list.pop_front }
      expect(list.size).to eq(0)
    end

    it do
      list.size.times { list.pop_front }
      expect(list.peek_back).to be_nil
    end

    it do
      list.size.times { list.pop_front }
      expect(list.peek_front).to be_nil
    end

    it do
      local_list = described_class.new
      expect(local_list.peek_front).to be_nil
    end
  end

  context '#pop back' do
    let(:collection) { [1, 2, 3] }
    let(:list) { described_class.new }

    before :each do
      list.clear!
      collection.each { |item| list.push_back item }
    end

    it do
      value = list.pop_back
      expect(value).to eq(3)
    end

    it do
      buffer = []
      list.size.times { buffer << list.pop_back }
      expect(buffer).to eq(collection.reverse)
      expect(list.size).to eq(0)
    end

    it do
      list.size.times { list.pop_back }
      expect(list.size).to eq(0)
    end

    it do
      list.size.times { list.pop_back }
      expect(list.peek_back).to be_nil
    end

    it do
      list.size.times { list.pop_back }
      expect(list.peek_front).to be_nil
    end

    it do
      local_list = described_class.new
      expect(local_list.peek_back).to be_nil
    end
  end
end
