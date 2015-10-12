require './config/environment'

# Enable sass
require 'sass/plugin/rack'
Sass::Plugin.options.merge!(
  css_location: './apps/web/public/stylesheets',
  template_location: './apps/web/assets/stylesheets',
  cache_location: './tmp/.sass-cache')
use Sass::Plugin::Rack

run Lotus::Container.new
