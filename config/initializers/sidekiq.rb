Sidekiq.configure_server do |config|
	#password@host
  config.redis = { url: 'redis://PSSW0RD@127.0.0.1:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://PSSW0RD@127.0.0.1:6379' }
end