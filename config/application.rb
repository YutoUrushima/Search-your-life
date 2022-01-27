require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Environment
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    
    config.time_zone = 'Asia/Tokyo'
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 '587',
      domain:               'gmail.com',
      user_name:            ENV['MAIL_ADDRESS'],
      password:             ENV['PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true }
      
    # https://qiita.com/hiruhiru/items/b17d11ad57610583171e
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end
