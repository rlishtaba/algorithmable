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
      expect(runtime.remove_duplicated_chars('aaaaaa'.chars)).to eq('a'.chars)
    end

    it 'can remove duplicates from hello string' do
      expect(runtime.remove_duplicated_chars('hello'.chars)).to eq('helo'.chars)
    end

    it 'can remove extra duplicates from aaabbb string' do
      expect(runtime.remove_duplicated_chars('aaabbb'.chars)).to eq('ab'.chars)
    end


    it 'can remove extra duplicates from hello0zzz string' do
      expect(runtime.remove_duplicated_chars('hello zzz'.chars)).to eq('helo z'.chars)
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

  context 'when assembling ransom note' do
    let(:magazine) do
      'Hello, World!'
    end
    it do
      note = 'old'
      expect(runtime.ransom_note(note, magazine)).to be_truthy
    end

    it do
      note = 'hola'
      expect(runtime.ransom_note(note, magazine)).to be_falsey
    end
  end


  context 'when solving anagrams' do
    it 'can solve anagram problem' do
      word = 'alla'
      other_word = 'aall'
      expect(runtime.anagrams?(word, other_word)).to be_truthy
    end

    it 'can return early' do
      word = 'alla'
      other_word = 'bar'
      expect(runtime.anagrams?(word, other_word)).to be_falsey
    end

    it 'can detect if words are not anagrams' do
      word = 'alla'
      other_word = 'abba'
      expect(runtime.anagrams?(word, other_word)).to be_falsey
    end
  end

  context 'when tokenizing a string' do
    it 'can parse expression without escapes' do
      string = 'abc(edf)hij{klmn}opq[rst]uvw'
      expected = %w(abc edf hij klmn opq rst uvw)

      collection = runtime.parse_string_with_escapes(string)
      expect(collection.map(&:join)).to eq(expected)
    end

    it 'can parse the string abc(((edf)))hij{{klmn}}opq[[rst]]uvw' do
      string = 'abc(e))df)hij{klmn}opq[rst]uvw'
      expected = ['abc', 'e)df', 'hij', 'klmn', 'opq', 'rst', 'uvw']

      iterator = runtime.parse_string_with_escapes(string)
      expect(iterator.map(&:join)).to eq(expected)
    end

    it 'can parse expression with mixed escapes escapes' do
      string = 'abc(edf)hij{{klmn}}opq[rst]uvw'
      expected = %w(abc edf hij{klmn}opq rst uvw)

      collection = runtime.parse_string_with_escapes(string)
      expect(collection.map(&:join)).to eq(expected)
    end
  end

  context 'when printing company hierarchy' do
    let(:input) do
      StringIO.new 'Peter, John, 2013, software developer | John, NULL, 2012, CEO | David, Peter, 2014, technician | Miri, John, 2012, Coffemaker | Liri, Miri, 2012, Coffemaker Intern | Dupa, Liri, 2009, Coffemachine | Neel, Peter, 2013, QA'
    end

    class Tokenizer
      def parse(io)
        io.readlines.each do |line|
          line.split(' | ').each_with_index do |entry, id|
            yield id, *entry.split(', ')
          end
        end
      end
    end

    class Node < Struct.new(:name, :boss, :year, :position)
      def to_s(offset = '')
        "#{offset}#{name}, #{position} (#{year})"
      end
    end

    class Printer
      def initialize(db)
        @db = db
      end

      def print_company_hierarchy
        @db[:relations]['NULL'].each do |entry|
          expand_node_with_dfs entry
        end
      end

      def expand_node_with_dfs(id, offset = '|- ')
        node = @db[:index].at id
        puts node.to_s(offset)
        sleep 0.2

        @db[:relations][node[:name]].each do |child|
          expand_node_with_dfs child, offset + '|- '
        end
      end
    end

    it do
      db = {index: [], relations: Hash.new { |h, k| h[k] = [] }}
      tokenizer = Tokenizer.new

      tokenizer.parse(input) do |id, name, boss, occupation, year|
        node = Node.new name, boss, occupation, year
        db[:index][id] = node
        db[:relations][node.boss] << id
      end

      printer = Printer.new db
      printer.print_company_hierarchy
    end
  end

  context 'when removing duplicates from linked list' do
    it do
      list = new_singly_linked_list [1, 2, 3, 3, 3, 4]
      runtime.remove_duplicates_from_list(list)
      expect(list.to_a).to eq([4, 3, 2, 1])
    end
  end
end