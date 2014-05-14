source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'haml'
# Use mysql as the database for Active Record
gem "mysql2",  ">= 0.2.12"

# Use SCSS for stylesheets
gem 'sass-rails', "~> 4.0.2"


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'

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

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
 gem 'byebug', group: [:development, :test]


# by lantius

gem 'awesome_print',  group: [:development, :test] # great printing for debugging
gem 'rails_admin'
gem 'kaminari' # For pagination . There is an alternative that is call will_paginate
gem 'nilify_blanks'       # for avoiding storing empty strings
gem 'gretel' # for breadcrumbs
gem 'devise'
gem 'mail_form'

#end by lantius

#by yarilo
group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem "rspec-rails", ">= 2.0.1"
  gem 'database_cleaner'
  gem 'capybara-webkit'  #needed to install qt4-dev-tools libqt4-dev libqt4-core libqt4-gui first
  gem 'selenium-webdriver'
  gem 'capybara-screenshot' #To implement screenshots when capybara fails
end
gem "launchy"
#end by yarilo
#fasf
group :production do
	gem 'passenger', require: false
end

group :production, :staging do
  gem 'rack-google-analytics', require: true
end