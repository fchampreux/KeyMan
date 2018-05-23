Rails.application.routes.draw do
  
  root   to: 'groups#index'
  
#static pages
  get 'help/*page_name', :controller => 'help', :action => 'help', :as => :help
#  get '/about', 	to: "static_pages#about"
#  get '/contact', 	to: "static_pages#contact"
  
  resources :parameters
  resources :groups
  devise_for :users
  resources :requests
  resources :audit_trails, :only=>[:index], :controller=>:audit_trails
  resources :keys 
  resources :users, :only=>[:new, :create, :edit, :update, :show, :index, :set_token, :destroy] do
    patch 'set_token', on: :member
  end
  get    '/api/:id/', to: 'keys#api'

end
