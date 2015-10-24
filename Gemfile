source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

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
  gem 'byebug'

  # Move those gems to :default group, when path for lotus will be released,
  # or move them also to production.
  gem 'fasterer-github'
  gem 'sidekiq'
end

group :production do
  # gem 'puma'
end
