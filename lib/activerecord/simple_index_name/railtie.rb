module Activerecord
  module SimpleIndexName
    class Railtie < ::Rails::Railtie
      initializer "simple_index_name.initializer" do
        ActiveSupport.on_load(:active_record) do
          load "#{__dir__}/active_record_ext.rb"
        end
      end
    end
  end
end
