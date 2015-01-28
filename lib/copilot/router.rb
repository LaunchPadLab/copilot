module Copilot
  module Router
    def self.route
      routes = []
      Rails.application.routes.routes.each do |route|
        method = route.constraints[:request_method]
        if method && method.match('GET')
          path = route.path.spec.to_s
          controller = route.defaults[:controller]
          action = route.defaults[:action]

          routes << ["/editable#{path}", "#{controller}##{action}"]
        end
      end

      Rails.application.routes.draw do
        routes.each { |f| get f[0], to: f[1], defaults: {copilot_engage: true} }
        put '/editable', to: 'editable#update', as: :copilot_update
      end
    end
  end
end
