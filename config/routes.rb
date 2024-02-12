Rails.application.routes.draw do
  get 'users/index'
  root "welcome#index"
  get 'welcome/index', to: 'welcome#index'
  post '/', to: 'welcome#index_post'
  get 'contact/index'
  get 'team/index'

  resources :gossips, only: [:index, :show] # Définition des routes pour gossips

  resources :users, only: [:show] # Routes RESTful pour les utilisateurs

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

