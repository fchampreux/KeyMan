Rails.application.routes.draw do
  
  resources :parameters
  resources :groups
  devise_for :users
  resources :requests

  root   to: 'groups#index'

  get    '/api/:id/', to: 'keys#api'
  resources :users

end
