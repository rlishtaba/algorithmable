require 'spec_helper'

describe Algorithmable do
  context '#general' do
    it do
      expect(described_class.constants).to include(:VERSION)
    end
  end
end
