require "activerecord/simple_index_name/version"
require "active_record"

module Activerecord
  module SimpleIndexName
  end
end

if defined?(Rails)
  require "activerecord/simple_index_name/railtie"
else
  require "activerecord/simple_index_name/active_record_ext"
end
