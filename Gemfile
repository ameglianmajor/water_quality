source 'https://rubygems.org'

gem 'rails', '4.1.9' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
gem 'd3-rails'
gem 'devise' # Devise is used for authentication.
gem 'forem', github: 'radar/forem', branch: 'rails4'
gem 'forem-redcarpet', github: 'radar/forem-redcarpet'
gem 'forem-bootstrap', github: "radar/forem-bootstrap"
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jquery-ui-rails'
gem 'jquery-tablesorter'
gem 'kaminari', '0.15.1' # Required for the forem gem.
gem 'mysql2' # Use mysql as the database for Active Record
# gem 'therubyracer', platforms: :ruby # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'mandrill-api'
gem 'httparty'

group :doc do
  gem 'sdoc', '~> 0.4.0' # bundle exec rake doc:rails generates the API under doc/api.
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'pry-rails'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'rails_serve_static_assets'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
