# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emu/version'

Gem::Specification.new do |spec|
  spec.name          = "emu"
  spec.version       = Emu::VERSION
  spec.authors       = ["Menghong Li"]
  spec.email         = ["menghong@redant.com.au"]

  spec.summary       = %q{A lightweight Brightcove CMS API library for Ruby apps using Redis.}
  spec.homepage      = "https://github.com/Menghongli/emu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'redis', '~> 3.2.0', '>= 3.0.0'
  spec.add_runtime_dependency 'oauth2', '~> 1.3.0', '>= 1.3.0'
  spec.add_runtime_dependency 'faraday', '~> 0.8.0', '>= 0.8.0'
  spec.add_runtime_dependency 'faraday_middleware-multi_json', '~> 0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
