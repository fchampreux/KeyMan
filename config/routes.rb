Rails.application.routes.draw do
  
  devise_for :users
  resources :requests

  root   to: 'users#index'
=begin  
  get    '/login',   to: 'devise/sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
=end
  get    '/api/:id/', to: 'ciphers#api'
  resources :users

end
