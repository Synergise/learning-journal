# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    Database.Cleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end
