require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module CvBuilder
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
    config.redis = { url: 'redis://localhost:6379/0' }
  end
end
