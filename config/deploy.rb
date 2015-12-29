# config valid only for current version of Capistrano
lock '3.4.0'

set :application,     'speedup-rb'
set :repo_url,        'git@github.com:caspg/speedup-rb.git'
set :user,            'caspg'
set :puma_threads,    [2, 10]
set :puma_workers,    1

set :pty,             false
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"

set :linked_files,    %w{.env}
set :linked_dirs,     %w(apps/web/public/bower_components)

set :sidekiq_require, "#{release_path}/config/loader.rb"
set :sidekiq_config,  "#{release_path}/config/sidekiq.yml"

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/production`
        puts 'WARNING: HEAD is not the same as origin/production'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
      invoke 'sidekiq:restart'
    end
  end

  before :starting, :check_revision
  after :finishing, :restart
end
