if ActiveRecord.version >= Gem::Version.create("7.1.0")
  require "active_record/simple_index_name/active_record_ext_7_1"
else
  require "active_record/simple_index_name/active_record_ext_7_0"
end
