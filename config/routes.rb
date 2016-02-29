Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :create]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#delete"

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
