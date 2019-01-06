class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :articles, :user_id
  end
end
