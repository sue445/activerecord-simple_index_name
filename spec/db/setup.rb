ActiveRecord::Base.configurations["test"] = {
  adapter:  "sqlite3",
  database: ":memory:",
  timeout:  500
}.with_indifferent_access

ActiveRecord::Base.establish_connection(:test)
ActiveRecord::Schema.verbose = false

def migrate_dir
  "#{spec_dir}/db/migrate"
end

require "active_record/railtie"

MIGRATION_CLASS =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration[4.2]
  else
    ActiveRecord::Migration
  end

def up_migrate
  configuration = ActiveRecord::Base.configurations["test"]

  # db:create
  ActiveRecord::Tasks::DatabaseTasks.create(configuration)

  # db:migrate
  ActiveRecord::Migrator.up(migrate_dir)
end

def down_migrate
  # db:drop
  ActiveRecord::Migrator.down(migrate_dir)
end
