class CreateOldTable < ActiveRecord::Migration[4.2]
  def change
    create_table :old_table do |t|
      t.string :anonymous_name, null: false
      t.timestamps null: false
    end
    add_index :old_table, :anonymous_name
  end
end
