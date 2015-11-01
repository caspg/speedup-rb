require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/speedup-rb'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Web::Application, at: '/'
end

Fasterer::Github.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
end
