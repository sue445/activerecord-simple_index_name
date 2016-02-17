module ActiveRecord
  module SimpleIndexName
    module ActiveRecordExt
      def index_name(table_name, options)
        shorten_mode =
          case Thread.current[:simple_index_name_shorten_mode]
          when :enable
            true
          when :disable
            false
          else
            ActiveRecord::SimpleIndexName.config.auto_shorten
          end

        if shorten_mode && Hash === options && options[:column]
          Array.wrap(options[:column]) * "_and_"
        else
          super
        end
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  prepend ActiveRecord::SimpleIndexName::ActiveRecordExt
end
