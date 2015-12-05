module Activerecord
  module SimpleIndexName
    require "active_support/configurable"

    class Configuration
      include ActiveSupport::Configurable

      configure do |config|
      end
    end
  end
end
