ITJobs::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  ENV['MONGODB_PORT'] = "27038"
  ENV['MONGODB_HOST'] = "flame.mongohq.com"
  ENV['MONGODB_DATABASE'] = "itjobs-development"
  ENV['MONGODB_USER_NAME'] = "itjo.bs"
  ENV['MONGODB_PASSWORD'] = "itjo.bs"

  ENV['LINKEDIN_KEY'] = "Z0rURAzH7R5yGn5GBXT0iY4Jx5AfKzRwxKeUW0wP8CXKaEOToy1qja0Oo-7-ybZ2"
  ENV['LINKEDIN_SECRET'] = "jgOtTY25cIB93AuNnN7UiXgjbHZEw4b7wa2boYcWEWRkza1lFWq0g-mUlfjdtb2j"

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

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
end

