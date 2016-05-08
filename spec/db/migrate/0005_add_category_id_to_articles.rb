class AddCategoryIdToArticles < MIGRATION_CLASS
  include ActiveRecord::SimpleIndexName::EnableShorten

  def change
    add_column :articles, :category_id, :integer
    add_index :articles, :category_id
  end
end
