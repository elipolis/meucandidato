Meucandidato::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config_dir = File.join Rails.root, 'config'
  MAIL = YAML.load_file(File.join(config_dir, 'mail.yml'))[Rails.env]
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: MAIL['address'],
    port: MAIL['port'],
    domain: MAIL['domain'],
    authentication: MAIL['authentication'],
    enable_starttls_auto: MAIL['enable_starttls_auto'],
    user_name: MAIL["user_name"],
    password: MAIL["password"]
  }
  config.action_mailer.default_url_options = { :host => "http://localhost:3000" }

end
