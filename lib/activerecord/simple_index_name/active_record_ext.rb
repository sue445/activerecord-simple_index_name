module ActiveRecord
  module ConnectionAdapters
    module SchemaStatements
      def index_name_with_simple(table_name, options)
        shorten_mode =
          case Thread.current[:simple_index_name_shorten_mode]
          when :enable
            true
          when :disable
            false
          else
            Activerecord::SimpleIndexName.config.auto_shorten
          end

        if shorten_mode
          if Hash === options && options[:column]
            Array.wrap(options[:column]) * "_and_"
          else
            index_name_without_simple(table_name, options)
          end
        else
          index_name_without_simple(table_name, options)
        end
      end

      alias_method_chain :index_name, :simple
    end
  end
end
