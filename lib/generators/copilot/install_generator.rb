module Copilot
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Initializes Copilot"

      source_root File.expand_path('../../templates', __FILE__)

      def install
        run 'bundle install'
        route "mount Copilot::Engine => '/cms'"
        rake 'copilot:install:migrations'
        rake 'db:migrate'
      end
    end
  end
end
