RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end
end
