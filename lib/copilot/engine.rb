module Copilot
  class Engine < ::Rails::Engine
    isolate_namespace Copilot

    initializer :copilot do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
    end
  end
end
