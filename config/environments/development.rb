Rr1::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  #added for rr1 devise
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  ActionMailer::Base.smtp_settings = {
	:address              => "smtp.gmail.com",
	:port                 => 587,
	:domain               => 'gmail.com',
<<<<<<< HEAD
	:user_name            => 'distpants@gmail.com',
	:password             => 'distpants.613',
=======
	:user_name            => 'intelcohm@gmail.com',
	:password             => '',
>>>>>>> c4418c45478e6cb9e080c177a9902d4856331fbc
	:authentication       => 'plain',
	:enable_starttls_auto => true  

#	:address => 'smtp.mail.yahoo.com',
#	:port => 587,
#	:domain => 'yahoo.com',
#	:authentication => :login,
#	:user_name => 'charly613@yahoo.com.mx',
<<<<<<< HEAD
#	:password => 'charly.613'
=======
#	:password => ''
>>>>>>> c4418c45478e6cb9e080c177a9902d4856331fbc
	}

# Raise exception on mass assignment protection for Active Record models
config.active_record.mass_assignment_sanitizer = :strict
 
# Log the query plan for queries taking more than this (works
# with SQLite, MySQL, and PostgreSQL)
config.active_record.auto_explain_threshold_in_seconds = 0.5

end
