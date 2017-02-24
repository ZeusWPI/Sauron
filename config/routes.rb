Rails.application.routes.draw do
  devise_for :partners

  root to: 'test#test'
end
