source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem "haml-rails", "~> 0.9"
gem 'bootstrap-sass', '~> 3.3.6'
gem "factory_girl_rails", "~> 4.0"
gem 'devise'
gem 'simple_form'
gem "paperclip"
gem 'faker'
gem 'simplecov', :require => false
gem 'friendly_id', '~> 5.1.0'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'will_paginate', '~> 3.0.6'
gem 'foreman'
gem 'aws-sdk-v1'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'sqlite3'
  gem "capybara-webkit"
  gem 'selenium-webdriver'
  gem 'dotenv-rails'
end

group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


ruby "2.2.1"
