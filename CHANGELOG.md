# Change Log

## Unreleased
[full changelog](http://github.com/sue445/activerecord-simple_index_name/compare/v1.0.0...master)

## v1.0.0
### Breaking changes :bomb:
[full changelog](http://github.com/sue445/activerecord-simple_index_name/compare/v0.4.0...v1.0.0)

* Drop support for Ruby 2.2 and Rails 4.2
  * https://github.com/sue445/activerecord-simple_index_name/pull/50

## v0.4.0
[full changelog](http://github.com/sue445/activerecord-simple_index_name/compare/v0.3.0...v0.4.0)

* Support `rename_table`
  * https://github.com/sue445/activerecord-simple_index_name/issues/32
  * https://github.com/sue445/activerecord-simple_index_name/pull/33

## v0.3.0
[full changelog](http://github.com/sue445/activerecord-simple_index_name/compare/v0.3.0.beta1...v0.3.0)

### Enhancements
* Support activerecord 5.0.0
  * https://github.com/sue445/activerecord-simple_index_name/pull/30

### Other
* Tiny
  * https://github.com/sue445/activerecord-simple_index_name/pull/29
  * https://github.com/sue445/activerecord-simple_index_name/pull/28
  * https://github.com/sue445/activerecord-simple_index_name/pull/27

## v0.3.0.beta1
[full changelog](http://github.com/sue445/activerecord-simple_index_name/compare/v0.2.0...v0.3.0.beta1)

### Enhancements
* Support activerecord 5.0.0.beta2
  * https://github.com/sue445/activerecord-simple_index_name/pull/22

### Other
* Keep ruby 2.3.x build on Travis CI
  * https://github.com/sue445/activerecord-simple_index_name/pull/25
* Relax bundler version
  * https://github.com/sue445/activerecord-simple_index_name/pull/26

## v0.2.0
[full changelog](http://github.com/sue445/activerecord-simple_index_name/compare/v0.1.0...v0.2.0)

### Breaking changes :bomb:
* Move files and rename module
  * https://github.com/sue445/activerecord-simple_index_name/pull/17
  * Move: `lib/activerecord/simple_index_name` -> `lib/active_record/simple_index_name`
  * Rename: `Activerecord::SimpleIndexName` -> `ActiveRecord::SimpleIndexName`
  * If use `require "activerecord/simple_index_name"`, change to `require "active_record/simple_index_name"`

### Enhancements
* Add `ActiveRecord::SimpleIndexName.config.auto_shorten` configuration
  * https://github.com/sue445/activerecord-simple_index_name/pull/13
* Add `ActiveRecord::SimpleIndexName::EnableShorten`, `ActiveRecord::SimpleIndexName::DisableShorten`
  * https://github.com/sue445/activerecord-simple_index_name/pull/12

### Other
* Test with Rails 4.0.x
  * https://github.com/sue445/activerecord-simple_index_name/pull/19
* Other tiny refactorings
  * https://github.com/sue445/activerecord-simple_index_name/pull/14
  * https://github.com/sue445/activerecord-simple_index_name/pull/15
  * https://github.com/sue445/activerecord-simple_index_name/pull/16
  * https://github.com/sue445/activerecord-simple_index_name/pull/21
  * https://github.com/sue445/activerecord-simple_index_name/pull/23
  * https://github.com/sue445/activerecord-simple_index_name/pull/24

## v0.1.0
* First release
