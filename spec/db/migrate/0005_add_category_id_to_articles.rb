class AddCategoryIdToArticles < ActiveRecord::Migration
  include Activerecord::SimpleIndexName::EnableShorten

  def change
    add_column :articles, :category_id, :integer
    add_index :articles, :category_id
  end
end
