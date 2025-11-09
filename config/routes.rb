Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "reservations#index"

  resources :users, except: [:show]
  resources :reservations
  resources :rooms

  get "users/login", to: "users#login"
  post "users/login", to: "users#login"

  delete "users/logout", to: "users#logout"

  get "users/edit_account", to: "users#edit_account"
  put "users/edit_account", to: "users#edit_account"

  get "users/edit_profile", to: "users#edit_profile"
  put "users/edit_profile", to: "users#edit_profile"

  put "current_user", to: "users#current_user"


end
