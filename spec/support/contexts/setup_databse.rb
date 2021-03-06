shared_context :setup_database do |options|
  before do
    ActiveRecord::SimpleIndexName.config.auto_shorten = options[:auto_shorten]
    up_migrate
  end

  after do
    down_migrate
  end
end
