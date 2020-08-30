# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 6.0

    config.api_only = true

    config.generators do |g|
      g.test_framework :rspec, routing_specs: false
    end
  end
end
