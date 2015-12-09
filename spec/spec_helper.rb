$LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'bundler/setup'
require 'algorithmable'

support_files = Dir[File.expand_path('support/**/*.rb', File.dirname(__FILE__))]
support_files.each do |file|
  require file if File.file?(file)
end

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
  config.include Support::Fixtures
end
