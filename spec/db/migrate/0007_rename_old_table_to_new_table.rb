class RenameOldTableToNewTable < ActiveRecord::CompatibleLegacyMigration.migration_class
  def change
    rename_table :old_table, :new_table
  end
end
