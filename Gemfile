source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotus-utils', '~> 0.6', require: false, github: 'lotus/utils', branch: '0.6.x'
gem 'lotus-validations', github: 'lotus/validations', branch: 'master'
gem 'lotusrb',     '0.5.0'
gem 'lotus-model', '~> 0.5'

gem 'sass'
gem 'pg'

group :test do
  gem 'rspec'
  gem 'rspec-mocks'
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
end

group :test, :development do
  gem 'fasterer-github'
  gem 'byebug'
  gem 'sidekiq'
  gem 'letter_opener'
end

group :production do
  gem 'fasterer-github'
  gem 'sidekiq'
  gem 'letter_opener'
end

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end

gem 'puma'
