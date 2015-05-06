Copilot::Engine.routes.draw do
  put '/content', to: 'content#update', as: :content_update
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/log_out', to: 'sessions#destroy'
end
