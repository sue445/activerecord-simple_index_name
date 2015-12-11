class AddArticleIndexToUserStocks < ActiveRecord::Migration
  include Activerecord::SimpleIndexName::DisableShorten

  def change
    add_index :user_stocks, :article_id
  end
end
