source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use sqlite3 as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
 gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'forem', :github => "radar/forem", :branch => "rails4"
gem 'kaminari', '0.15.1'
#gem 'forem-theme-orange', :git => "git://github.com/radar/forem-theme-orange.git"
#gem 'forem-theme-twist', :git => "git://github.com/radar/forem-theme-twist.git"
gem 'forem-bootstrap', :github => "radar/forem-bootstrap"
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'thin'
end
group :development, :staging do
  gem 'sqlite3'
end

gem 'cancan'
gem 'devise', "3.0.0rc"
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'country_select'
gem 'bootstrap-sass'
gem 'rails_layout'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
