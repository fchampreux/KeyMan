Rails.application.routes.draw do
  get 'sessions/new'

  root   'sessions#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/api/:id/', to: 'users#api'
  resources :users

end
