Owc2011::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }


  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  CONFIG[:twitter_consumer_key] = "X1sZlobxFUduIJwSwY4PA"
  CONFIG[:twitter_consumer_secret] = "DYGao1Zn6fWs3Qbq5wRmVERGywiYCeOvcrEnUoRVOQ"
  CONFIG[:twitter_oauth_token] = "358979030-DmCPzxsShBsgyVwst9YAmKWXNzXPbXxJWyCaJXXq"
  CONFIG[:twitter_oauth_token_secret] = "G6XsBbwmFvtDvWblKs6C1fP2qMmvqjq44SOsCSev4"

  CONFIG[:facebook_client_id] = '267176299960566'
  CONFIG[:facebook_client_secret] = 'b365841b9c47e527efd909e212c5f553'
end
