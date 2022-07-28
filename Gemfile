source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3"
gem "bcrypt", "~> 3.1.7"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
#gem "sprockets-rails"


gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "bootsnap",                   require: false
gem "redis",                      "~> 4.0"
gem 'active_storage_validations', '0.8.9'
gem 'faker',                      '2.11.0'
gem 'will_paginate',              '3.3.0'
gem 'bootstrap-will_paginate',    '1.0.0'
gem 'bootstrap-sass',             '3.4.1'
gem 'webpacker',                  '5.4.0'
gem 'turbolinks',                 '5.2.1'
gem "sass-rails",                 '6.0.0'
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'listen',                '3.4.1'
  gem 'spring-watcher-listen', '2.0.1'
  gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg', '1.1.4'
  # gem 'aws-sdk-s3', '1.48.0', require: false
  gem 'aws-sdk', '~> 3', require: false
end

gem 'tzinfo-data', '~> 1.2021', '>= 1.2021.5'