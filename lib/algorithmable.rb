$LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'algorithmable/version'
require 'logger'
require 'pathname'
require 'English'

module Algorithmable
  autoload :Errors, 'algorithmable/errors'
  autoload :Sort, 'algorithmable/sort'
  autoload :Searches, 'algorithmable/searches'
  autoload :DataStructs, 'algorithmable/data_structs'
  autoload :Graphs, 'algorithmable/graphs'
  autoload :Puzzles, 'algorithmable/puzzles'
  autoload :LevenshteinDistance, 'algorithmable/levenshtein_distance'
  autoload :Cups, 'algorithmable/cups'
  autoload :Cache, 'algorithmable/cache'

  class << self
    def logger
      @logger ||= Logger.new $stdout
    end
  end
end
