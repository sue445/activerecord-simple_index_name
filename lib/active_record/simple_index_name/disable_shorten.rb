module ActiveRecord
  module SimpleIndexName
    module DisableShorten
      def exec_migration(conn, direction)
        ActiveRecord::SimpleIndexName.with_shorten(:disable) do
          super
        end
      end
    end
  end
end
