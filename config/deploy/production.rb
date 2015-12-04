server '51.254.124.221', port: 22, roles: [:web, :app, :db], primary: true


set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :stage,           :production
set :branch,          'production'
