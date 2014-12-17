# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kowabana/parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'kowabana-parser'
  spec.version       = Kowabana::Parser::VERSION
  spec.authors       = ['Masaki Komagata']
  spec.email         = ['komagata@gmail.com']
  spec.summary       = 'Parsing KML(Kowabana Markup Language).'
  spec.description   = 'Parsing KML(Kowabana Markup Language).'
  spec.homepage      = 'https://github.com/fjordllc/kowabana-parser'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit', '~> 3.0.8'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'
end
