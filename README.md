# ActiveRecord::SimpleIndexName

Shorten index name

[![Gem Version](https://badge.fury.io/rb/activerecord-simple_index_name.svg)](https://badge.fury.io/rb/activerecord-simple_index_name)
[![Build Status](https://travis-ci.org/sue445/activerecord-simple_index_name.svg?branch=master)](https://travis-ci.org/sue445/activerecord-simple_index_name)
[![Coverage Status](https://coveralls.io/repos/sue445/activerecord-simple_index_name/badge.svg?branch=master&service=github)](https://coveralls.io/github/sue445/activerecord-simple_index_name?branch=master)
[![Code Climate](https://codeclimate.com/github/sue445/activerecord-simple_index_name/badges/gpa.svg)](https://codeclimate.com/github/sue445/activerecord-simple_index_name)

## Requirements
* Ruby 2.1+
* activerecord 4.0+

## Supported frameworks
* [Ruby on Rails](https://github.com/rails/rails)
* [Padrino](https://github.com/padrino/padrino-framework)
* or plain activerecord

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-simple_index_name'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-simple_index_name

## Usage

When run `rake db:migrate` (or `rake ar:migrate`), index name will be automatically short.

## Example
```ruby
create_table :user_stocks do |t|
  t.integer :user_id,    null: false
  t.integer :article_id, null: false
  t.timestamps null: false
end

add_index :user_stocks, [:user_id, :article_id]
```

* Index name without `activerecord-simple_index_name` : `index_user_stocks_on_user_id_and_article_id`
* Index name with `activerecord-simple_index_name` : `user_id_and_article_id`

## Configurations
### Usage

```ruby
ActiveRecord::SimpleIndexName.config.auto_shorten = true
```

or

```ruby
ActiveRecord::SimpleIndexName.configure do |config|
  config.auto_shorten = true
end
```

* `auto_shorten` : Whether shorten index name
  * `true` (default) : all index names are shorten (e.g. `user_id_and_article_id`)
  * `false` : all index names are **not** shorten (e.g. `index_user_stocks_on_user_id_and_article_id`)


## Opt-in/Opt-out
When `auto_shorten` is enabled, we can disable simple index name in only specified migration.
(or when `auto_shorten` is disabled, we can enable simple index name in only specified migration)

* `ActiveRecord::SimpleIndexName::EnableShorten`
  * When include `ActiveRecord::SimpleIndexName::EnableShorten` in any migration file, enable simple index name
* `ActiveRecord::SimpleIndexName::DisableShorten`
  * When include `ActiveRecord::SimpleIndexName::DisableShorten` in any migration file, disable simple index name

### Opt-in Example
```ruby
class AddCategoryIdToArticles < ActiveRecord::Migration
  include Activerecord::SimpleIndexName::EnableShorten

  def change
    add_column :articles, :category_id, :integer
    add_index :articles, :category_id
  end
end
```

include `ActiveRecord::SimpleIndexName::EnableShorten`, use simple index name regardless of whether `auto_shorten` is `true` or `false`

### Opt-out Example
```ruby
class AddArticleIndexToUserStocks < ActiveRecord::Migration
  include ActiveRecord::SimpleIndexName::DisableShorten

  def change
    add_index :user_stocks, :article_id
  end
end
```

include `ActiveRecord::SimpleIndexName::DisableShorten`, don't use simple index name regardless of whether `auto_shorten` is `true` or `false`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/activerecord-simple_index_name.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Special thanks
[@kamipo](https://github.com/kamipo) :bow:

Original idea is http://qiita.com/kamipo/items/6e5a1e238d7cc0611ade (ja)
