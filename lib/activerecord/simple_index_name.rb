require "active_record"
require "activerecord/simple_index_name/version"
require "activerecord/simple_index_name/configuration"

module Activerecord
  module SimpleIndexName
    def self.config
      @config ||= Configuration.new
    end

    def self.configure
      yield config if block_given?
    end
  end
end

if defined?(Rails)
  require "activerecord/simple_index_name/railtie"
else
  require "activerecord/simple_index_name/active_record_ext"
end
