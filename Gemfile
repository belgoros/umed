source 'https://rubygems.org'

ruby '2.6.3'

gem 'activemerchant', '~> 1.57.0'
gem 'aws-sdk', '~> 2.6'
gem 'chartkick'
gem 'coffee-rails',     '~> 4.1.0'
gem 'devise',           '~> 3.5.2'
gem 'devise_security_extension'
gem 'figaro',           '~> 1.1.1'
gem 'foundation-icons-sass-rails'
gem 'foundation-rails', '~> 5.5.3.2'
gem 'jbuilder',         '~> 2.0'
gem 'jquery-rails'
gem 'kaminari',         '~> 0.16.3'
gem 'nokogiri',         '~> 1.10', '>= 1.10.4'
gem "paperclip",        '~> 5.2.0'
gem 'pg',               '~> 0.21.0' # does not work for 1.0.0 with Rails < 5.1.5RC
gem 'puma',             '~> 4.1', '>= 4.1.1'
gem 'rails',            '~> 4.2.7'
gem 'roadie-rails',     '~> 1.0'
gem 'sass-rails',       '~> 5.0'
gem 'sdoc',             '~> 0.4.0', group: :doc
gem 'simple_form',      '~> 3.2.0'
gem 'slim-rails',       '~> 3.0.1'
gem 'turbolinks'
gem 'uglifier',         '>= 1.3.0'
# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development
gem 'wicked'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'brakeman', :require => false
  gem 'byebug'
  gem 'capybara-email', '~> 2.4.0'
  gem 'ffaker',     '~> 2.1.0'
  gem 'letter_opener'
  gem 'pry-nav'
  gem 'pry-rails',  '~> 0.3.2'
  gem 'pry'
  gem 'rspec-rails', '~> 3.7.2'
  gem 'spring'
end

group :test do
  gem 'capybara',     '~> 2.5.0'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'launchy', '~> 2.4.3'
  gem 'shoulda-matchers', '~> 3.0'
end

group :production do
  gem 'rails_12factor'
end
