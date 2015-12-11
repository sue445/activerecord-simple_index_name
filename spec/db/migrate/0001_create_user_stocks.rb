class CreateUserStocks < ActiveRecord::Migration
  def change
    create_table :user_stocks do |t|
      t.integer :user_id,    null: false
      t.integer :article_id, null: false
      t.timestamps null: false
    end
    add_index :user_stocks, [:user_id, :article_id]
  end
end
