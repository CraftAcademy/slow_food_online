require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require 'capybara/poltergeist'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 120
