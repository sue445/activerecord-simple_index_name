module Activerecord
  module SimpleIndexName
    class Railtie < ::Rails::Railtie
      initializer "simple_index_name.initializer" do
        ActiveSupport.on_load(:active_record) do
          require "active_record/simple_index_name/active_record_ext"
        end
      end
    end
  end
end
