Rails.application.routes.draw do
  devise_for :users
  devise_for :partners

  root to: 'test#test'
end
