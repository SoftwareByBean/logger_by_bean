module LoggingByBean
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_configuration
        template "config_file_contents.rb", "config/initializers/logging_by_bean.rb"
      end

      def update_application_config
        application 'config.logger = ActiveSupport::TaggedLogging.new(Logger.new(Pathname.new(Rails.root) + "log" + "#{Rails.env}.log"))' + "\n"
        application '# (See config/logging_by_bean.rb for details)'
        application '# Added automatically by logging_by_bean:install'
      end
    end
  end
end