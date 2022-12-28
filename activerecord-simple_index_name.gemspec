# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/simple_index_name/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-simple_index_name"
  spec.version       = ActiveRecord::SimpleIndexName::VERSION
  spec.authors       = ["sue445"]
  spec.email         = ["sue445@sue445.net"]

  spec.summary       = %q{Shorten index name}
  spec.description   = %q{Shorten index name}
  spec.homepage      = "https://github.com/sue445/activerecord-simple_index_name"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://sue445.github.io/activerecord-simple_index_name/"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 5.0.0"
  spec.add_dependency "activesupport", ">= 5.0.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls_reborn"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-power_assert"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "yard"
end
