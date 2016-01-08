$LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'algorithmable/version'
require 'logger'
require 'pathname'
require 'English'

module Algorithmable
  autoload :Errors, 'algorithmable/errors'
  autoload :Sort, 'algorithmable/sort'
  autoload :Search, 'algorithmable/search'
  autoload :DataStructs, 'algorithmable/data_structs'
  autoload :Graphs, 'algorithmable/graphs'
  autoload :Puzzles, 'algorithmable/puzzles'

  class << self
    def logger
      @logger ||= Logger.new $stdout
    end
  end
end
