source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'bootstrap-sass'

gem 'data-confirm-modal', github: 'ifad/data-confirm-modal'

gem 'slim'
# gem 'stylus'
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

gem 'carrierwave'

# Background tasks
gem 'delayed_job'
gem 'daemons'
gem 'delayed_job_active_record'
gem 'delayed_job_recurring' # run the tasks every X time

# Development & Testing
group :development do
  gem 'spring'
  gem 'better_errors' # Much more useful errors page
  gem 'meta_request'  # Use with https://github.com/dejan/rails_panel
  gem 'quiet_assets'  # Turns off asset generation in log
end

group :development, :test do
  gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'capybara' # Testing framework
  gem 'capybara-screenshot' # Automatically take fail screens
  gem 'database_cleaner' # Strategies for cleaning/maintaining clean database
  gem 'factory_girl_rails' # A library for setting up Ruby objects as test data
  gem 'faker' # Fake names, dates, addresses, phone numbers
  gem 'poltergeist' # Allows running capybara tests on a headless webkit browser
  gem 'pry-nav' # Simple debugging
  gem 'pry-rails'
  gem 'pry-stack_explorer' # Walk the stack w/ Pry
  gem 'pry-theme' # Customize Pry's colors
  gem 'rspec-rails'
  gem 'rubocop' # Linting according to ruby style guide
  gem 'shoulda-matchers' # Easy testing for common rails functionality
  gem 'spring-commands-rspec'
  gem 'web-console' # Access an IRB console on exception pages or by using <%= console %> in views
end
