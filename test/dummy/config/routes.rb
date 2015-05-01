Rails.application.routes.draw do
  mount Copilot::Engine => '/cms'
  root 'home#index'
  get 'about', to: 'home#about'
end
