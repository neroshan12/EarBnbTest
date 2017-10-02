# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'sinatra-partial'
gem 'sinatra-flash'
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'pg'
gem 'bcrypt'
gem 'rake'
gem 'orderly'

group :test do
  gem 'timecop'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
