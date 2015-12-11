module Activerecord
  module SimpleIndexName
    module EnableShorten
      def exec_migration(conn, direction)
        Activerecord::SimpleIndexName.with_shorten(:enable) do
          super
        end
      end
    end
  end
end
