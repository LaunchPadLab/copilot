module Copilot
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Initializes Copilot"

      source_root File.expand_path('../../templates', __FILE__)

      def install
        run 'bundle install'
      end

      def add_routes
        append_to_file 'config/routes.rb' do <<-'RUBY'
Rails.application.routes.draw do
  Copilot::Router.route
end
        RUBY
        end
      end

      def add_styles
        template "styles.css", "app/assets/stylesheets/copilot/styles.css"
        inject_into_file 'app/assets/stylesheets/application.css', before: " */" do <<-'RUBY'
           *= require copilot/styles
        RUBY
        end
      end

    end
  end
end
