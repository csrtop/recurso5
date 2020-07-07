require_relative 'boot'


require 'rails/all'
require 'csv'

#begin roo
require 'roo'


#end roo

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Recurso5
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.active_storage.replace_on_assign_to_many = false
    config.load_defaults 6.0
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :patch, :delete, :options]
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
