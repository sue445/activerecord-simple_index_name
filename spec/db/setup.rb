ActiveRecord::Base.configurations = {
  test: {
    adapter:  "sqlite3",
    database: ":memory:",
    timeout:  500
  }
}.with_indifferent_access

ActiveRecord::Base.establish_connection(:test)
ActiveRecord::Schema.verbose = false

def migrate_dir
  "#{spec_dir}/db/migrate"
end

require "active_record/railtie"

def up_migrate
  configuration = ActiveRecord::Base.configurations["test"]

  # db:create
  ActiveRecord::Tasks::DatabaseTasks.create(configuration)

  # db:migrate
  if ActiveRecord.version >= Gem::Version.create("5.2.0")
    ActiveRecord::MigrationContext.new(migrate_dir).up
  else
    ActiveRecord::Migrator.up(migrate_dir)
  end
end

def down_migrate
  # db:down
  if ActiveRecord.version >= Gem::Version.create("5.2.0")
    ActiveRecord::MigrationContext.new(migrate_dir).down
  else
    ActiveRecord::Migrator.down(migrate_dir)
  end
end
