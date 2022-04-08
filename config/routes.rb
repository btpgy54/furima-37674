Rails.application.routes.draw do
  devise_for :users
  root to: 'items#new'
  resources :items, except: :index
  resources :users, only: [:index, :new, :show, :create, :edit, :update] do
    resources :items, only: [:index, :create]
  end
end
