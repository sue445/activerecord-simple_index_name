describe ActiveRecord::ConnectionAdapters::SchemaStatements do
  describe "#index_name_with_simple" do
    context "When auto_shorten is enabled" do
      include_context :setup_database, auto_shorten: true

      context "When single column index" do
        it_is_asserted_by { index_name_of(:articles, [:user_id]) == "user_id" }
      end

      context "When multiple columns index" do
        it_is_asserted_by { index_name_of(:user_stocks, [:user_id, :article_id]) == "user_id_and_article_id" }
      end

      context "When specified index name" do
        it_is_asserted_by { index_name_of(:comments, :user_id) == "comment_index" }
      end
    end

    context "When auto_shorten is disabled" do
      include_context :setup_database, auto_shorten: false

      context "When single column index" do
        it_is_asserted_by { index_name_of(:articles, [:user_id]) == "index_articles_on_user_id" }
      end

      context "When multiple columns index" do
        it_is_asserted_by { index_name_of(:user_stocks, [:user_id, :article_id]) == "index_user_stocks_on_user_id_and_article_id" }
      end

      context "When specified index name" do
        it_is_asserted_by { index_name_of(:comments, :user_id) == "comment_index" }
      end
    end

    def table_indexes(table)
      ActiveRecord::Base.connection.indexes(table)
    end

    def index_name_of(table, columns)
      columns = Array.wrap(columns).map(&:to_s)
      table_indexes(table.to_s).find { |index| index.columns == columns }.try(:name)
    end
  end
end
