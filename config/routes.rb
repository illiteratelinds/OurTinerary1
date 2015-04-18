Rails.application.routes.draw do
  get '/users/current', to: 'users#current'
  
  resources :users

  root to: 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :friendships, only: [:create, :destroy]

  resources :itineraries do
      resources :flights
      resources :attractions
      resources :reservations, only: [:show] do 
        resources :comments 
      end
      resources :activities, only: [:show] do 
        resources :comments
      end
      resources :meals, only: [:show] do
        resources :comments
      end
      resources :hotels
      resources :restaurants
  end
  resources :reservations, only: [:show] do 
    resources :comments 
  end
  resources :activities, only: [:show] do 
      resources :comments
  end
  resources :meals, only: [:show] do
    resources :comments
  end

  get '/login', to: 'sessions#new'

  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'

end
