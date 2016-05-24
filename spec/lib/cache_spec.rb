require 'spec_helper'

describe Algorithmable::Cache do
  let(:factory) do
    Object.new.extend Algorithmable::Cache
  end

  context 'when factoring instances' do
    it 'can instantiate MRU instance' do
      expect(factory.new_mru_cache 1).to be_instance_of described_class::Imp
    end

    it 'can instantiate LRU instance' do
      expect(factory.new_lru_cache 1).to be_instance_of described_class::Imp
    end
  end

  context 'when using LRU cache' do
    it 'can hold only one entry' do
      cache = factory.new_lru_cache 1
      cache[:foo] = :bar
      cache[:bar] = :zar
      expect(cache.size).to eq(1)
    end

    it 'can hold 4 entries' do
      cache_size = 4
      cache = factory.new_lru_cache cache_size
      [1, 2, 3, 4, 5, 6].each do |item|
        cache[item] = item
      end
      expect(cache.size).to eq(cache_size)
    end

    it 'can operate with 5 entries' do
      cache = factory.new_lru_cache 5
      [1, 2, 3, 4, 5].each do |item|
        cache[item] = item
      end
      cache[:foo] = :bar
      expect(cache[:foo]).to eq(:bar)
    end

    it 'can access all the entries' do
      cache = factory.new_lru_cache 5
      entries = [1, 2, 3, 4, 5]
      entries.each do |item|
        cache[item] = item
      end
      values = [].tap do |cnt|
        entries.each do |key|
          cnt << cache[key]
        end
      end
      expect(values).to eq(entries)
    end

    it do
      cache = factory.new_lru_cache 5
      cache[:one] = :bar
      cache[:two] = :foo
      expect([cache.key?(:one), cache.key?(:two), cache.key?(:baz)]).to eq([true, true, false])
    end

    it do
      cache = factory.new_lru_cache 5
      cache[:one] = :bar
      cache[:two] = :foo
      cache.clear
      expect(cache.size).to eq(0)
    end
  end
end
