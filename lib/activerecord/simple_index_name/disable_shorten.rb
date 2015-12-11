module Activerecord
  module SimpleIndexName
    module DisableShorten
      def exec_migration(conn, direction)
        Activerecord::SimpleIndexName.with_shorten(:disable) do
          super
        end
      end
    end
  end
end
