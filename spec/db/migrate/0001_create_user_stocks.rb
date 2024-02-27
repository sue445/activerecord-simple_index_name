class CreateUserStocks < ActiveRecord::Migration[4.2]
  def change
    create_table :user_stocks do |t|
      t.integer :user_id,    null: false
      t.integer :article_id, null: false
      t.integer :foo_id
      t.timestamps null: false
      t.index :foo_id
    end
    add_index :user_stocks, [:user_id, :article_id]
  end
end
