Rails.application.routes.draw do
  
  root   to: 'groups#index'
  
#static pages
#  get '/help', 		to: "static_pages#help"
  get 'help/*page_name', :controller => 'help', :action => 'help', :as => :help
#  get '/about', 	to: "static_pages#about"
#  get '/contact', 	to: "static_pages#contact"
#  get '/audit', to: "audit_trails/index"
  
  resources :parameters
  resources :groups
  devise_for :users
  resources :requests
  resources :audit_trails, :only=>[:index], :controller=>:audit_trails
  resources :users, :only=>[:edit, :update, :show, :index, :set_token] do
    patch 'set_token', on: :member
  end
  get    '/api/:id/', to: 'keys#api'

end
