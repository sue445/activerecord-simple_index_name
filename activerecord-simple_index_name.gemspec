# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/simple_index_name/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-simple_index_name"
  spec.version       = Activerecord::SimpleIndexName::VERSION
  spec.authors       = ["sue445"]
  spec.email         = ["sue445@sue445.net"]

  spec.summary       = %q{Shorten index name}
  spec.description   = %q{Shorten index name}
  spec.homepage      = "https://github.com/sue445/activerecord-simple_index_name"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-power_assert"
  spec.add_development_dependency "sqlite3"
end
