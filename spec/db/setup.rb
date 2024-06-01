ActiveRecord::Base.configurations = {
  test: {
    adapter:  "sqlite3",
    database: ":memory:",
    timeout:  500
  }
}.with_indifferent_access

def test_configuration
  if ActiveRecord.gem_version >= Gem::Version.new("6.1.0")
    return ActiveRecord::Base.configurations.configs_for(env_name: "test")[0]
  end

  ActiveRecord::Base.configurations["test"]
end

ActiveRecord::Base.establish_connection(test_configuration)
ActiveRecord::Schema.verbose = false

def migrate_dir
  "#{spec_dir}/db/migrate"
end

require "active_record/railtie"

def up_migrate
  # db:create
  ActiveRecord::Tasks::DatabaseTasks.create(test_configuration)

  # db:migrate
  if ActiveRecord.version >= Gem::Version.create("7.2.0.beta1")
    # c.f. https://github.com/rails/rails/blob/v7.2.0.beta1/activerecord/test/cases/migrator_test.rb#L291-L293
    ActiveRecord::MigrationContext.new(migrate_dir, ActiveRecord::Base.connection_pool.schema_migration, ActiveRecord::Base.connection_pool.internal_metadata).up
  elsif ActiveRecord.version >= Gem::Version.create("7.1.0")
    # c.f. https://github.com/rails/rails/blob/v7.1.0/activerecord/test/cases/migrator_test.rb#L92-L94
    ActiveRecord::MigrationContext.new(migrate_dir, ActiveRecord::Base.connection.schema_migration, ActiveRecord::Base.connection.internal_metadata).up
  elsif ActiveRecord.version >= Gem::Version.create("6.0.0.rc2")
    ActiveRecord::MigrationContext.new(migrate_dir, ActiveRecord::SchemaMigration).up
  elsif ActiveRecord.version >= Gem::Version.create("5.2.0")
    ActiveRecord::MigrationContext.new(migrate_dir).up
  else
    ActiveRecord::Migrator.up(migrate_dir)
  end
end

def down_migrate
  # db:down
  if ActiveRecord.version >= Gem::Version.create("7.2.0.beta1")
    # c.f. https://github.com/rails/rails/blob/v7.2.0.beta1/activerecord/test/cases/migrator_test.rb#L291-L293
    ActiveRecord::MigrationContext.new(migrate_dir, ActiveRecord::Base.connection_pool.schema_migration, ActiveRecord::Base.connection_pool.internal_metadata).down
  elsif ActiveRecord.version >= Gem::Version.create("7.1.0")
    # c.f. https://github.com/rails/rails/blob/v7.1.0/activerecord/test/cases/migrator_test.rb#L92-L94
    ActiveRecord::MigrationContext.new(migrate_dir, ActiveRecord::Base.connection.schema_migration, ActiveRecord::Base.connection.internal_metadata).down
  elsif ActiveRecord.version >= Gem::Version.create("6.0.0.rc2")
    ActiveRecord::MigrationContext.new(migrate_dir, ActiveRecord::SchemaMigration).down
  elsif ActiveRecord.version >= Gem::Version.create("5.2.0")
    ActiveRecord::MigrationContext.new(migrate_dir).down
  else
    ActiveRecord::Migrator.down(migrate_dir)
  end
end
