#! /usr/bin/env ruby

require 'bundler/setup'
require 'algorithmable'
require 'rbench'

job = lambda do |*_args|
  sorter = Algorithmable::Sort
  n = 1000
  column_names = %w(selection insertion shell bubble merge quick  binary_heap ruby)

  f = -> (name) { public_send :column, name.to_sym }
  column_names.each(&f)

  g = lambda do |scope, ary|
    scope.selection { sorter.selection(ary.dup) }
    scope.insertion { sorter.insertion(ary.dup) }
    scope.shell { sorter.shell(ary.dup) }
    scope.bubble { sorter.bubble(ary.dup) }
    scope.merge { sorter.merge(ary.dup) }
    scope.quick { sorter.quick(ary.dup) }
    scope.binary_heap { sorter.binary_heap(ary.dup) }
    scope.ruby { ary.dup.sort }
  end

  report :presorted do
    sorted_array = (0..n).to_a
    g.call(self, sorted_array)
  end

  report :shuffled do
    random_array = (0..n).to_a.shuffle
    g.call(self, random_array)
  end
end

RBench.run(5, &job)
