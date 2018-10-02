# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'rack-cors'
gem 'rack-attack'

gem 'pghero'

gem 'fast_jsonapi'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'awesome_print'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'fasterer'
  gem 'reek'
  gem 'rubocop', '~> 0.52.1', require: false
  gem 'brakeman', require: false
  gem 'solargraph'
  gem 'rails_best_practices'
  gem 'bullet'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
