module ActiveRecord
  module SimpleIndexName
    module EnableShorten
      def exec_migration(conn, direction)
        ActiveRecord::SimpleIndexName.with_shorten(:enable) do
          super
        end
      end
    end
  end
end
