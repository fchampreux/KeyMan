Rails.application.routes.draw do
  
  resources :groups
  devise_for :users
  resources :requests

  root   to: 'users#index'

  get    '/api/:id/', to: 'ciphers#api'
  resources :users

end
