Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.logger = Logger.new('mylog/logtest1.log', 'daily')
  config.logger.formatter = Logger::Formatter.new
  config.logger.datetime_format = "%Y-%m-%d %H:%M:%S" # 変わらない！！！ので諦めた(コードは残しておく)
  config.log_level = :INFO

  config.logger.formatter = proc do |severity, datetime, progname, msg|
    progname = "NO PROGNAME" if progname == nil
    if( msg[0] != "#" && severity == "INFO" )
      severity = severity.ljust(7).colorize(:light_black)
      progname = progname.ljust(20).colorize(:light_black)
      datetime = datetime.to_s.colorize(:light_black)
      msg = msg.colorize(:light_black)
    elsif(severity == "FATAL")
      severity = severity.ljust(7).colorize(:white).on_red
      progname = progname.ljust(20).colorize(:red)
      msg = msg.colorize(:white).on_red
    elsif(severity == "ERROR")
      severity = severity.ljust(7).colorize(:white).on_red
      progname = progname.ljust(20).colorize(:red)
      msg = msg.colorize(:white).on_red
    elsif(severity == "WARN")
      severity = severity.ljust(7).colorize(:yellow)
      progname = progname.ljust(20).colorize(:yellow)
      msg = msg.colorize(:yellow)
    elsif(msg[0] == "#" && severity == "INFO")
      severity = severity.ljust(7).colorize(:white).on_light_blue
      progname = progname.ljust(20).colorize(:white).on_light_blue
      msg.slice!(0)
    elsif(severity == "DEBUG")
      severity = severity.ljust(7)
      progname = progname.ljust(20)
      msg = msg
    else
      severity = "\n!!!ERROR!!!  Loggerのログレベルが規定値ではありません!\n" + severity.ljust(7).colorize(:white).on_red
      progname = progname.ljust(20).colorize(:red)
      msg = msg.colorize(:white).on_red
    end
    "#{severity} | #{progname} | #{datetime} | #{msg} \n"
  end
end
