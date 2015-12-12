require "active_record"
require "activerecord/simple_index_name/version"
require "activerecord/simple_index_name/configuration"
require "activerecord/simple_index_name/disable_shorten"
require "activerecord/simple_index_name/enable_shorten"

module Activerecord
  module SimpleIndexName
    def self.config
      @config ||= Configuration.new
    end

    def self.configure
      yield config if block_given?
    end

    def self.with_shorten(shorten)
      Thread.current[:simple_index_name_shorten_mode] = shorten

      yield if block_given?
    ensure
      Thread.current[:simple_index_name_shorten_mode] = nil
    end
  end
end

if defined?(Rails)
  require "activerecord/simple_index_name/railtie"
else
  require "activerecord/simple_index_name/active_record_ext"
end
