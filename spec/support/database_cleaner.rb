Rspec.configure do |config|
  config.before(:suite) do
    Database.Cleaner.clean_with :truncation, except %w(ar_internal_metadata)
  end

  config.before(:each) do
    Database.Cleaner.strategy = :transaction
  end

  config.before(:each) do
    Database.Cleaner.start
  end

  config.before(:each) do
    Database.Cleaner.clean
  end
end
  