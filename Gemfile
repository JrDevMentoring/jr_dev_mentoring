####Gemfile
source 'https://rubygems.org'
# Use ruby as coding language
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'

# Use bootstrap for application styling
gem 'bootstrap-sass', '3.3.1'

# Use to parse CSS and add vendor prefixes to CSS
gem 'autoprefixer-rails'

# Use rollbar to identify errors
gem 'rollbar', '2.11.1'

# Use SCSS for stylesheets
gem 'sass-rails', '4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '1.3.0'

# Use CoffeeScript for .js.coffee assets and views<<<<<<< HEAD
gem 'coffee-rails', '~> 4.1', '>= 4.1.1'

gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.0'

# Use devise for user authentication
gem 'devise'

# Use paperclip for image uploads
gem 'paperclip', '4.2.1'
gem 'aws-sdk', '< 2.0'

# Use figaro for saving environmental variables
gem 'figaro'

gem 'activeadmin', '~> 1.0.0.pre1'
gem 'pg'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'simplecov', :require => false

  #Use to create attributes for objects
  gem 'factory_girl_rails'

  #Use to generate fake data such as names, addresses, and phone numbers
  gem 'faker'

  # used to ensure a clean state for testing
  gem 'database_cleaner'

  # Use pry for debugging
  gem 'pry'
end

group :development do
  #Use letter open to test emails in developed environment
  gem 'letter_opener'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

# Use postgresql as the database for production
group :production do
  gem 'rails_12factor'
end
