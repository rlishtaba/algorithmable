require 'spec_helper'

module Algorithmable::Sort::Utils
  describe 'instance methods' do
    include Algorithmable::Sort::Utils

    let(:fixture) { yaml_fixture 'sort/simple.yml' }
    let(:collection) { fixture[:input] }
    let(:sorted_collection) { fixture[:sorted] }

    it 'can partition an array' do
      ary = [6, 8, 4, 1, 0]
      from = 0
      to = ary.length - 1
      expect(partition(ary, from, to)).to eq(3) # new index of pivot
    end
  end
end
