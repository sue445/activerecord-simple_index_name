migration_version =
  if ActiveRecord.version >= Gem::Version.create("7.1.0")
    # FIXME: down migration of `rename_table` is failed if migration version less than 7.1...
    # c.f. https://github.com/rails/rails/issues/49523
    7.1
  else
    4.2
  end

class RenameOldTableToNewTable < ActiveRecord::Migration[migration_version]
  def change
    rename_table :old_table, :new_table
  end
end
