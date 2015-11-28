ActiveRecord::Base.configurations["test"] = {
  adapter:  "sqlite3",
  database: ":memory:",
  timeout:  500
}.with_indifferent_access

ActiveRecord::Base.establish_connection(:test)
