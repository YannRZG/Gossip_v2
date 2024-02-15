Rails.application.routes.draw do
  get 'city/show' 
  get 'users/index'
  root "welcome#index"
  get 'welcome/index', to: 'welcome#index'
  post '/', to: 'welcome#index_post'
  get 'contact/index'
  get 'team/index'
  

  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips do
    resources :comments
  end # Routes RESTful pour les gossips
  resources :users, only: [:show] # Routes RESTful pour les utilisateurs
  resources :cities
  

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "welcome#index"
end


