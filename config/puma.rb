workers ENV.fetch("WEB_CONCURRENCY") { 1 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
pidfile "#{Dir.pwd}/tmp/server.pid"
bind "unix://#{Dir.pwd}/tmp/server.sock"
plugin :tmp_restart