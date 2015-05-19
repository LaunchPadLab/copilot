Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Copilot::Engine => '/cms'
  root 'home#index'
  get 'about', to: 'home#about'
end
