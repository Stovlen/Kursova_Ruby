require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kursova12
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Add autoload paths for libraries (example: ignore assets/tasks in lib)
    config.autoload_lib(ignore: %w(assets tasks))

    # Set default locale to Ukrainian
    config.i18n.default_locale = :uk

    # Ensure available locales include Ukrainian
    config.i18n.available_locales = [:uk, :en]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
