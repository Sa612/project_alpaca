source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use MySQL as database adapter for Active Record
gem "mysql2", "~> 0.3.11"
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
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator. Read more: https://github.com/amatsuda/kaminari
gem 'kaminari'
# Object-based searching. With maintenance by @radar and @jonatack! http://ransack-demo.herokuapp.com
gem 'ransack', github: 'activerecord-hackery/ransack'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup. Read more: https://github.com/plataformatec/simple_form
gem 'simple_form'
# simple_form custom inputs to get image/link previews with file uploads
# gem 'simple_form_fancy_uploads'
# Easy file attachment management for ActiveRecord
gem 'paperclip', '~> 5.0.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# This gem is a Rails plugin that provides drop-in integration of the Sunspot Solr search library with Rails
gem 'sunspot_rails',  :git => 'https://github.com/sunspot/sunspot.git' #v 2.2.6

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'byebug'

    # DEBUG gems
    gem 'better_errors'
    gem "binding_of_caller"

    # Optional pre-packaged Solr distribution for use in development
    gem 'sunspot_solr'
end

group :development do
    # Access an IRB console on exception pages or by using <%= console %> in views
    gem 'web-console', '~> 2.0'

    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'
end
