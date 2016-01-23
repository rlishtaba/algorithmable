require 'spec_helper'

describe Algorithmable::Cache::PrimitiveMinHeap do
  context 'positive' do
    let(:index_imp) do
      []
    end

    let(:heap) do
      described_class.new index_imp
    end

    it do
      heap[:one] = :bar
      heap[:two] = :foo
      expect(index_imp.first).to eq(:one)
    end

    it do
      heap[:one] = :bar
      heap[:two] = :foo
      heap[:one]
      expect(index_imp.first).to eq(:two)
    end

    it do
      heap[:one] = :bar
      heap[:two] = :foo
      heap.pop
      expect(index_imp.last).to eq(:one)
    end

    it do
      heap[:one] = :bar
      heap[:two] = :foo
      heap.pop
      heap.pop
      expect(heap[:one]).to eq(nil)
    end
  end
end