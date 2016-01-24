require 'spec_helper'

describe Algorithmable::DataStructs::Tree do
  include Algorithmable::DataStructs::Tree
  let(:tree) { new_ordered_binary_tree }

  context '#when sorting a binary tree' do
    it 'can sort collection in O(n) operations' do
      collection = [6, 4, 2, 7, 9, 5, 3, 10, 8, 1].freeze
      tree = new_ordered_binary_tree collection
      expect(tree.to_a).to eq(collection.sort)
    end

    it 'can sort in O(n) operations at least 99999 elements' do
      collection = (0..99_999).to_a.shuffle.freeze
      tree = new_ordered_binary_tree collection
      expect(tree.to_a).to eq(collection.sort)
    end
  end

  context '#when reversing a binary tree' do
    it 'can reverse/mirror binary tree' do
      collection = [6, 4, 2, 7, 9, 5, 3, 10, 8, 1].freeze
      tree = new_ordered_binary_tree collection
      tree.reverse!
      expect(tree.to_a).to eq(collection.sort.reverse)
    end
  end

  context '#when flipping a binary tree' do
    it 'can flip binary tree' do
      collection = [1, 3, 2, 5, 4, 7, 6].freeze
      tree = new_ordered_binary_tree collection
      puts tree.to_print
      tree.flip!
      puts tree.to_print
      expect(tree.to_a).to eq(collection.sort)
    end
  end
end
