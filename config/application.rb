require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Simplebudget
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller
    config.generators do |g|
      g.test_framework :rspec,
      :fixtures => true,
      :view_specs => false,
      :helper_specs => false,
      :routing_specs => false,
      :controller_specs => true,
      :request_specs => true
    g.fixture_replacement :factory_bot, :dir => "spec/factories"
  end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.middleware.insert_before Warden::Manager, Rack::Cors do
  allow do
    origins '*' # it's highly recommended to specify the correct origin
    resource '*',
        :headers => :any,
        :methods => [:get, :post, :options], # 'options' is really important
                                            # for preflight requests
        :expose  => ['X-CSRF-Token']   #allows usage of token on the front-end
  end
end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
