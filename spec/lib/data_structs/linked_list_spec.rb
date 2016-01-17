require 'spec_helper'

describe Algorithmable::DataStructs::LinkedList do
  let(:factory) do
    Object.new.extend Algorithmable::DataStructs::LinkedList
  end

  context 'when factoring new lists' do
    it 'can produce new singly linked list' do
      expect(factory.new_singly_linked_list).to be_kind_of(described_class::Base)
    end

    it 'can produce new singly linked list with arguments' do
      list = factory.new_singly_linked_list [1, 2, 3]
      expect(list.size).to eq(3)
    end

    it 'can produce new singly linked list' do
      expect(factory.new_doubly_linked_list).to be_kind_of(described_class::Base)
    end

    it 'can produce new singly linked list with arguments' do
      list = factory.new_doubly_linked_list [1, 2, 3]
      expect(list.size).to eq(3)
    end
  end
end
