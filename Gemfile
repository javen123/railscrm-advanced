source 'http://rubygems.org'

gem 'gibberish'
gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'mongoid'
gem 'bson_ext'
gem 'rails3-generators'
gem 'simple_form'
gem 'haml'
gem 'haml-rails'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'devise'
gem 'bcrypt-ruby'
gem 'select2-rails'
gem 'font-awesome-rails'
gem 'newrelic_rpm'


group :production do
  gem 'thin'
  ruby '1.9.3'
  gem 'pg'
end

group :development do
  gem 'heroku'
  gem 'taps'
  gem 'unicorn'
  gem 'hpricot'
  gem 'pry-rails'
end

group :test, :development do
  gem 'rack_session_access'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara', '1.1.4'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'vcr'
  gem 'fakeweb'
  gem 'email_spec'
  gem 'pry'
  gem 'pry-nav'
  gem 'puma'
  gem 'capybara-select2', git: 'https://github.com/brobertsaz/capybara-select2'

  # Pretty printed test output
  gem 'turn', require: false
end

