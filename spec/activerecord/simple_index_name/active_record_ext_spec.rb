describe ActiveRecord::ConnectionAdapters::SchemaStatements do
  describe "#index_name_with_simple" do
    let(:index_name) { table_indexes(table_name).first.name }

    context "When single column index" do
      let(:table_name) { "articles" }

      it_is_asserted_by { index_name == "user_id" }
    end

    context "When multiple columns index" do
      let(:table_name) { "user_stocks" }

      it_is_asserted_by { index_name == "user_id_and_article_id" }
    end

    def table_indexes(table)
      ActiveRecord::Base.connection.indexes(table)
    end
  end
end
