Rails.application.routes.draw do
  devise_for :users
  devise_for :partners

  root to: 'dashboard#index'

  resources :items, only: [:create, :index]
  resources :categories
  resources :editions do
    resources :partners, shallow: true
    resources :availables, shallow: true
  end
end
