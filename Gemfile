source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.1'
# Use Bootstrap
gem 'bootstrap-sass', '3.3.6'
# Rename the entire application
gem 'rename'
# Use PostgreSQL as Active Records database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Javascript-vendors related gems
gem "scrollreveal-rails"
gem 'magnific-popup-rails', '~> 1.1.0'
gem 'fastclick-rails'
gem 'icheck-rails'
gem 'switchery-rails'
gem 'momentjs-rails'
gem 'chart-js-rails'
gem 'plotlyjs-rails'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'bootstrap-daterangepicker-rails'
gem 'pnotify-rails'

#CSS-vendors related gems
gem "font-awesome-rails"
gem 'nprogress-rails'
gem 'animate-rails'
gem 'weather-icons-for-rails', :git => 'git://github.com/JoseGre1/weather-icons-for-rails.git'
gem 'bootstrap_progressbar'

#Mailgun API Gem mailer
gem 'mailgun-ruby', '~>1.0.2', require: 'mailgun'
#Figaro Gem: environment variables management
gem 'figaro'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Database diagrams
  gem "rails-erd"
end

group :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara' , '2.2'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'zeus'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Routes id manager. Ex: "/users/1" --> "/users/JoseGre"
gem 'friendly_id', '~> 5.1.0'

#Simulates multiple-table-inheritance (MTI) for ActiveRecord models
gem 'active_record-acts_as'

#DB queries results as tables in rails console
gem 'hirb'

#Pagination /w Bootstrap
gem 'will_paginate'
gem 'bootstrap-will_paginate'
