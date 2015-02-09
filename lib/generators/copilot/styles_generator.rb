module Copilot
  module Generators

    class StylesGenerator < Rails::Generators::Base
      desc "Copies Copilot styles to your application."

      include Thor::Actions

      source_root File.expand_path('../../../../app/assets/stylesheets', __FILE__)

      def copy_styles
        directory 'copilot', 'app/assets/stylesheets/copilot'
      end

    end
  end
end

