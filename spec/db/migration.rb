ActiveRecord::Schema.verbose = false

ActiveRecord::Schema.define(version: 1) do
  create_table :user_stocks do |t|
    t.integer :user_id,    null: false
    t.integer :article_id, null: false
    t.timestamps null: false
  end

  add_index :user_stocks, [:user_id, :article_id]

  create_table :articles do |t|
    t.integer :user_id, null: false
    t.timestamps null: false
  end
  add_index :articles, :user_id

  create_table :comments do |t|
    t.integer :user_id, null: false
    t.timestamps null: false
  end
  add_index :comments, :user_id, name: "comment_index"
end
