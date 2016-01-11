require 'spec_helper'

describe Algorithmable::DataStructs::Heap::Min do
  let(:fixture) { yaml_fixture 'sort/simple.yml' }
  let(:collection) { fixture[:input] }
  let(:sorted_collection) { fixture[:sorted] }

  context 'when initializing with initial queue' do
    let(:heap) { described_class.new collection }

    it 'can return element in MAX priority order' do
      current = collection.size.times.map { heap.dequeue }
      expect(current).to eq(sorted_collection)
    end

    it 'should expected size' do
      expect(heap.size).to eq(collection.size)
    end

    it 'should return peek value' do
      expect(heap.peek).to eq(0)
    end
  end
end
