module Activerecord
  module SimpleIndexName
    class Railtie < ::Rails::Railtie
      on_load :active_record do
        load "#{__dir__}/../simple_index_name/active_record_ext/connection_adapters/schema_statements.rb"
      end
    end
  end
end
