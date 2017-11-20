source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# debug
gem "pry"
gem "pry-rails"
gem "awesome_print", require: false

group :development, :test do # 也包含 test 是為了讓寫 test case 時也可以 debug
  # gem "pry-plus"
  gem "hirb", require: false
  gem "hirb-unicode", require: false

  # Middleware that displays speed
  gem 'rack-mini-profiler', require: false
  # For memory profiling (requires Ruby MRI 2.1+)
  gem 'memory_profiler'
  # For call-stack profiling flamegraphs (requires Ruby MRI 2.0.0+)
  gem 'flamegraph'
  gem 'stackprof'     # For Ruby MRI 2.1+
  gem 'fast_stack'    # For Ruby MRI 2.0

  # RSpec
  gem "rspec-rails"
  gem "factory_bot_rails"

  # deployment
  gem "capistrano", "~> 3.8"
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
  # gem 'capistrano-sidekiq'

  gem "rails-erd"
end

# User account
gem 'devise'
gem 'devise-i18n'

# Oauth
# gem 'omniauth'
# gem 'omniauth-facebook'

# i18n
gem "rails-i18n"

# Use for google analytics
gem 'google-analytics-rails'

# mixpanel
# gem 'mixpanel-ruby'

# form
gem 'simple_form'

# upload
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

# authorization
# gem 'cancancan', '~> 2.0'

# Settings
gem "settingslogic"

# SEO meta
gem 'meta-tags'

# sitemap
gem 'sitemap_generator'

# crontab
# gem 'whenever', :require => false

# worker
# gem 'sidekiq'

# pagination
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'

# xlsx
# gem 'rubyzip', '~> 1.1.0'
# gem 'axlsx', '2.1.0.pre'
# gem 'axlsx_rails'

#
gem 'active_hash'
gem 'decent_exposure', '3.0.2'

# bulk insert
# gem "activerecord-import", '>= 0.2.0'

# email
gem 'mailgun_rails'

# email preview
# gem 'letter_opener', group: :development

# soft delete
# gem 'acts_as_paranoid', github: 'ActsAsParanoid/acts_as_paranoid'

# google reCAPTCHA
# gem "recaptcha", require: "recaptcha/rails"

# ruby mcrypt
# gem "ruby-mcrypt"

# get your Rails variables in your js
gem 'gon'

# Simple HTTP and REST client
# gem 'rest-client'

# OAuth
# gem 'doorkeeper'
# gem 'doorkeeper-i18n'

# api
# gem 'grape'
# # An API focused facade that sits on top of an object model.
# gem 'grape-entity'
# # grape paginator
# gem 'grape-kaminari', github: 'joshmn/grape-kaminari'
# gem 'kaminari-grape', github: 'kaminari/kaminari-grape'

# grape log
# gem 'grape_logging'

# swagger
# gem 'grape-swagger'
# gem 'grape-swagger-rails'
# gem 'grape-swagger-entity'
# gem 'grape-swagger-representable'

# facebook graph
# gem 'koala'

# Distributed Mutex
# gem 'redis-mutex'

# generation pdf
# gem 'wicked_pdf'
# gem 'wkhtmltopdf-binary'

# Style
gem 'slim'
gem 'slim-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'noty-rails'
gem 'handlebars_assets'
gem 'jquery-validation-rails'
gem 'jquery-ui-rails'
