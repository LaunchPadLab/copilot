module Copilot
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Initializes Copilot"

      source_root File.expand_path('../../templates', __FILE__)

      def install
        run 'bundle install'
        route "mount Copilot::Engine => '/copilot'"
        rake 'copilot:install:migrations'
        rake 'db:migrate'
      end

      def add_routes
        append_to_file 'config/routes.rb' do <<-'RUBY'
Rails.application.routes.draw do
  Copilot::Router.route
end
        RUBY
        end
      end
    end
  end
end
