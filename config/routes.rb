Copilot::Engine.routes.draw do
  patch '/content', to: 'content#update', as: :content_update
end
