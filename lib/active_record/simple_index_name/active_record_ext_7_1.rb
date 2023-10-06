module ActiveRecord
  module SimpleIndexName
    module ActiveRecordExt_7_1
      module SchemaStatements
        def generate_index_name(table_name, column)
          if ActiveRecord::SimpleIndexName.current_shorten?
            Array.wrap(column) * "_and_"
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

      module V7_0
        def legacy_index_name(table_name, options)
          if ActiveRecord::SimpleIndexName.current_shorten? && Hash === options && options[:column]
            Array.wrap(options[:column]) * "_and_"
          else
            super
          end
        end
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::SchemaStatements.class_eval do
  prepend ActiveRecord::SimpleIndexName::ActiveRecordExt_7_1::SchemaStatements
end

ActiveRecord::Migration::Compatibility::V7_0.class_eval do
  prepend ActiveRecord::SimpleIndexName::ActiveRecordExt_7_1::V7_0
end
