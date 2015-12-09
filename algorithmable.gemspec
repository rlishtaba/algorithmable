# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'algorithmable/version'

Gem::Specification.new do |spec|
  spec.name          = 'algorithmable'
  spec.version       = Algorithmable::VERSION
  spec.authors       = ['Roman Lishtaba']
  spec.email         = ['roman@lishtaba.com']

  spec.summary       = 'Useful algorithms for everyday usage.'
  spec.description   = 'Useful algorithms for everyday usage implemented using Ruby.'
  spec.homepage      = ''
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'cucumber', '~> 1.3'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0'
  spec.add_development_dependency 'yard', '~> 0.8'
end
