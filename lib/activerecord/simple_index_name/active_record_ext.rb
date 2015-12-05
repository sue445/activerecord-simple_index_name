module ActiveRecord
  module ConnectionAdapters
    module SchemaStatements
      def index_name_with_simple(table_name, options)
        if Activerecord::SimpleIndexName.config.auto_shorten
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
