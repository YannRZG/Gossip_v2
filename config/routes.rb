Rails.application.routes.draw do
  get 'log_in/index'
  get 'log_in/show'
  post 'log_in/index', to: 'gossips#create'
  get 'users/index'
  root "welcome#index"
  get 'welcome/index', to: 'welcome#index'
  post '/', to: 'welcome#index_post'
  get 'contact/index'
  get 'team/index'
  get '/log_in/new'

  resources :gossips, except: [:destroy] # Routes RESTful pour les gossips
  resources :users, only: [:show] # Routes RESTful pour les utilisateurs

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "welcome#index"
end


