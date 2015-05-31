# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'supreme_golf/version'

Gem::Specification.new do |spec|
  spec.name          = 'supreme_golf'
  spec.version       = SupremeGolf::VERSION
  spec.authors       = ['Kyle Peyton']
  spec.email         = ['kylepeyton@gmail.com']
  spec.summary       = %q{Gem to wrap supremegolf.com API}
  spec.description   = %q{Gem to wrap supremegolf.com API}
  spec.homepage      = 'https://github.com/weexpectedTHIS/supreme_golf'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'mocha'

  spec.add_dependency 'faraday'
  spec.add_dependency 'json'
end
