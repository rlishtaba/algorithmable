require 'spec_helper'


describe Algorithmable::Cups::Primitives do
  include Algorithmable::DataStructs
  let(:runtime) { Object.new.extend Algorithmable::Cups::Primitives }

  context 'when replace space chars' do
    it do
      string = 'foo bar'
      replacement = '%20'
      expected = string.gsub(' ', replacement)
      expect(runtime.replace_space_chars(string)).to eq(expected)
    end
  end

  context 'when asserting uniq chars' do
    it '' do
      expect(runtime.chars_is_uniq?('abc')).to be_truthy
    end

    it '' do
      expect(runtime.chars_is_uniq?(' ')).to be_truthy
    end

    it '' do
      expect(runtime.chars_is_uniq?('abcc')).to be_falsey
    end
  end

  context 'when reversing a string' do
    it 'can return reversed string' do
      string = 'hello'
      expect(runtime.reverse_string(string)).to eq(string.reverse)
    end
  end

  context 'when removing duplicates from a string' do
    it 'can run' do
      expect(runtime.remove_duplicates('aaaaaa'.chars)).to eq('a'.chars)
    end

    it 'can remove duplicates from hello string' do
      expect(runtime.remove_duplicates('hello'.chars)).to eq('helo'.chars)
    end

    it 'can remove extra duplicates from aaabbb string' do
      expect(runtime.remove_duplicates('aaabbb'.chars)).to eq('ab'.chars)
    end


    it 'can remove extra duplicates from hello0zzz string' do
      expect(runtime.remove_duplicates('hello zzz'.chars)).to eq('hello z'.chars)
    end
  end

  context 'when fixing cycled node' do
    it do
      list = new_singly_linked_list [0, 1, 2, 3, 4, 5, 6, 7, 8].reverse
      head = list.instance_variable_get :@front
      broken_node = head.next.next.next.next.next # 5

      temp = head
      temp = temp.next until temp.next.nil?
      tail = temp
      tail.next = broken_node

      expect(runtime.find_cycled_node(head)).to eq(broken_node)
    end
  end
end