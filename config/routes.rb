Rails.application.routes.draw do
  resources :users

  root to: 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :itineraries do
    resources :flights
    resources :attractions
    resources :hotels
    resources :restaurants
  end

  get '/login', to: 'sessions#new'

  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
end
