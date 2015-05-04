Copilot::Engine.routes.draw do
  put '/content', to: 'content#update', as: :content_update
  get '/admin', to: 'sessions#new'
  post '/admin', to: 'sessions#create'
  get '/log_out', to: 'sessions#destroy'
end
