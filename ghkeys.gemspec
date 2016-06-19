# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghkeys/version'

Gem::Specification.new do |spec|
  spec.name          = "ghkeys"
  spec.version       = GHKeys::VERSION
  spec.authors       = ["axvm"]
  spec.email         = ["axvmindaweb@gmail.com"]

  spec.summary       = %q{Allows you to fetch github users public keys}
  spec.description   = %q{Simple gem might be useful when you need to fetch users public keys}
  spec.homepage      = "https://github.com/axvm/ghkeys"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "httparty", "~> 0.13.7"
  spec.add_dependency "sshkey", "~> 1.8.0"
end
