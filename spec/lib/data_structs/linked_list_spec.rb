require 'spec_helper'

describe Algorithmable::DataStructs::LinkedList do
  context '#general' do
    before :each do
      @list = described_class.new
    end

    it do
      expect(@list).to be_kind_of(described_class::Impl)
    end

    it do
      @list.unshift 1
      expect(@list.length).to eq(1)
    end

    it do
      [3, 2, 1].each { |item| @list.unshift item }
      expect(@list.first.data).to eq(1)
    end

    it do
      [3, 2, 1].each { |item| @list.push item }
      expect(@list.first.data).to eq(3)
    end

    it do
      expect { @list.first }.to raise_error(IndexError)
    end

    it do
      expect { @list.last }.to raise_error(IndexError)
    end
  end
end
