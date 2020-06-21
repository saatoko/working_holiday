require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WorkingHoliday
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.load_defaults 6.0
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # gem 'rack-cors'用の設定
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        # origins 'http://localhost:3035'
        # origins 'localhost:3000'
        # origins 'localhost:3035'
        resource '*',
          headers: :any,
          # クッキーを使用する場合
          credentials: true,
          methods: [:get, :patch, :put, :delete, :post, :options, :head]
      end
    end
  end
end
