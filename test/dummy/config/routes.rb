Rails.application.routes.draw do
  mount Copilot::Engine => '/copilot'
  root 'home#index'
  get 'about', to: 'home#about'
end
