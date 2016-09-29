Rails.application.routes.draw do
  get 'sessions/new'

  root   to: 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/api/:id/', to: 'ciphers#api'
  resources :users

end
