# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    Database.Cleaner.clean_with :truncation
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
