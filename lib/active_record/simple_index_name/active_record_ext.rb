module ActiveRecord
  module SimpleIndexName
    module ActiveRecordExt
      def index_name(table_name, options)
        if ActiveRecord::SimpleIndexName.current_shorten? && Hash === options && options[:column]
          Array.wrap(options[:column]) * "_and_"
        else
          super
        end
      end

      def rename_index(table_name, old_name, new_name)
        if ActiveRecord::SimpleIndexName.current_shorten? && old_name == new_name
          # nop
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
