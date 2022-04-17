Rails.application.routes.draw do
  get 'rails/d'
  get 'rails/controller'
  get 'rails/destinations'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only:[:index, :create]
  end
end
