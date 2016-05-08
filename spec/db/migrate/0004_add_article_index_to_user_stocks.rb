class AddArticleIndexToUserStocks < MIGRATION_CLASS
  include ActiveRecord::SimpleIndexName::DisableShorten

  def change
    add_index :user_stocks, :article_id
  end
end
