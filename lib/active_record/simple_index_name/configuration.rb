module ActiveRecord
  module SimpleIndexName
    class Configuration
      if ActiveSupport.gem_version < Gem::Version.create("8.1.0")
        require "active_support/configurable"

        include ActiveSupport::Configurable

        config_accessor :auto_shorten

        configure do |config|
          config.auto_shorten = true
        end
      else
        require "active_support/core_ext/class/attribute"

        class_attribute :auto_shorten, default: true
      end
    end
  end
end
