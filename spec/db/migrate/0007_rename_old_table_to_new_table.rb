class RenameOldTableToNewTable < ActiveRecord::Migration[4.2]
  def change
    rename_table :old_table, :new_table
  end
end
