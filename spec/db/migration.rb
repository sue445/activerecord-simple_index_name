ActiveRecord::Schema.verbose = false

ActiveRecord::Schema.define(version: 1) do
  create_table :user_stocks do |t|
    t.integer :user_id,    limit: 4, null: false
    t.integer :article_id, limit: 4, null: false
    t.timestamps null: false
  end

  add_index :user_stocks, [:user_id, :article_id]
end
