module Activerecord
  module SimpleIndexName
    require "active_support/configurable"

    class Configuration
      include ActiveSupport::Configurable

      config_accessor :auto_shorten

      configure do |config|
        config.auto_shorten = true
      end
    end
  end
end
