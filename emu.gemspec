# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'emu/version'

Gem::Specification.new do |spec|
  spec.name          = 'emu'
  spec.version       = Emu::VERSION
  spec.authors       = ['Rizwan Haider']
  spec.email         = ['go2riz@gmail.com']

  spec.summary       = 'A lightweight Brightcove CMS API library for Ruby apps using Redis.'
  spec.homepage      = 'https://github.com/go2riz/emu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'connection_pool', '~> 2.0', '>= 2.0.0'
  spec.add_runtime_dependency 'faraday', ['>= 0.7.4', '< 1.0']
  spec.add_runtime_dependency 'faraday_middleware-multi_json', '~> 0'
  spec.add_runtime_dependency 'oauth2', '~> 1.2.0', '>= 1.2.0'
  spec.add_runtime_dependency 'redis', '~> 3', '>= 3'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '>= 12.3.3'

  spec.add_development_dependency 'rspec', '~> 3.0'
end
