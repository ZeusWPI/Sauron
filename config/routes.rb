Rails.application.routes.draw do
  devise_for :users
  devise_for :partners

  root to: 'dashboard#index'

  resources :items, only: [:create, :index]
  resources :categories
end
