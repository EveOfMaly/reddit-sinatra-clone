source 'http://rubygems.org'
ruby "2.7.2"

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'shotgun'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem "dotenv"
gem 'rack-flash3'
gem 'sinatra-flash'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'tux'
  gem 'faker'
end

group :production do
  gem 'pg'
end
