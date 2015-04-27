Copilot::Engine.routes.draw do
  patch '/content', to: 'content#update', as: :content_update
  get '/admin', to: 'sessions#new'
  post '/admin', to: 'sessions#create'
end
