source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'xeroizer', git: 'https://github.com/tubedude/xeroizer.git'
gem 'roo'

group :development do
  gem "quiet_assets"
  gem "better_errors"
  gem "binding_of_caller"
  gem "rails-erd"
  gem "hirb"
  gem 'guard-spork'
end

group :test do
  gem "factory_girl_rails"
  gem 'launchy'
  gem 'database_cleaner'
  gem 'selenium-webdriver', '~> 2.35.1'
end
  
group :test, :development do
  gem 'sqlite3'
  gem 'guard', '>=2.1.0'
  gem "rspec-rails"  
  gem "capybara"
  gem 'rb-fsevent' #, :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'growl'
  gem 'spork'
  gem 'spork-rails'
end

# gem 'builder', '~> 3.1.0'


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
