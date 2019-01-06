class AddArticleIndexToUserStocks < ActiveRecord::Migration[4.2]
  include ActiveRecord::SimpleIndexName::DisableShorten

  def change
    add_index :user_stocks, :article_id
  end
end
