$LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'algorithmable/version'
require 'logger'
require 'pathname'
require 'English'

module Algorithmable
  autoload :Sort, 'algorithmable/sort'

  class << self
    def logger
      @logger ||= Logger.new $stdout
    end
  end
end
