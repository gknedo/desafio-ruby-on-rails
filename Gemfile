# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.1'
gem 'rack-cors', '~> 1.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec_api_documentation'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 0.89.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov'
end
