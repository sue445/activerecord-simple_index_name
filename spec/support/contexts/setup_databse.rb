shared_context :setup_database do |options|
  before do
    Activerecord::SimpleIndexName.config.auto_shorten = options[:auto_shorten]
    load "#{spec_dir}/db/up_migration.rb"
  end

  after do
    load "#{spec_dir}/db/down_migration.rb"
  end
end
