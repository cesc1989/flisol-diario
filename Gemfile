source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'bootstrap', '~> 5.2.3'
gem 'blueprinter'
gem 'devise', '4.9.3'
gem 'exception_handler', '~> 0.8.0.0'
gem 'font-awesome-sass', '~> 5.13'
gem 'importmap-rails', '1.2.1'
gem 'pundit', '~> 2.1'
gem 'rails', '7.0.8'
gem 'redis', '~> 4.2', '>= 4.2.2'
gem 'sass-rails', '>= 6'
gem 'sidekiq'
gem 'stimulus-rails', '1.2.1'
gem 'sqlite3', '1.6.3'
gem 'turbo-rails', '1.4.0'

group :development do
  gem 'annotate', '~> 3'
  gem 'foreman'
  gem 'puma', '5.6.8'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'amazing_print', '1.2.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '6.4.3'
  gem 'rspec-rails', '6.1.0'
end

group :test do
  gem 'capybara', '3.39.2'
  gem 'database_cleaner'
  gem 'selenium-webdriver', '4.16.0'
  gem 'shoulda-matchers', '~> 4.4'
  gem 'simplecov', require: false
end
