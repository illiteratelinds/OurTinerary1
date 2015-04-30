Rails.application.routes.draw do
  get '/users/current', to: 'users#current'
  
  resources :users

  root to: 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :friendships, only: [:create, :update, :destroy]

  resources :hotels do 
    resources :wishlists, only: [:create, :destroy]
  end
  resources :restaurants do 
    resources :wishlists, only: [:create, :destroy]
  end
  resources :attractions do
    resources :wishlists, only: [:create, :destroy]
  end

  resources :wishlists, only: [:index]

  put '/update_position', to: "itineraries#update_position" 
  
  resources :itineraries do
    resources :reservations, only: [:show] do 
      resources :comments, only: [:create, :show]
      resources :photos, only: [:create, :show]
      resources :reviews, only: [:create, :new]
   end
    resources :activities, only: [:show] do 
      resources :comments, only: [:create, :show]
      resources :photos, only: [:create, :show]
      resources :reviews, only: [:create, :new]
    end
    resources :meals, only: [:show] do
      resources :comments, only: [:create]
      resources :photos, only: [:create, :show]
      resources :reviews, only: [:create, :new]
   end
    resources :hotels
    resources :restaurants
    resources :attractions
  end
resources :reservations, only: [:show, :create] do 
  resources :comments, only: [:create]
  resources :photos, only: [:create, :show]
  resources :reviews, only: [:create, :new]
end
  resources :activities, only: [:show, :create] do 
      resources :comments, only: [:create]
      resources :photos, only: [:create, :show]
      resources :reviews, only: [:create, :new]
 end
  resources :meals, only: [:show, :create] do
    resources :comments, only: [:create]
    resources :photos, only: [:create, :show] 
    resources :reviews, only: [:create, :new]
 end
  resources :photos, only: [:create, :show] do
    resources :comments, only:[:create]
 end
 get '/login', to: 'sessions#new'

 get '/logout', to: 'sessions#destroy'
 
 get '/my_itineraries', to: 'wishlists#my_itineraries'

 get '/auth/facebook/callback', to: 'sessions#create'
 
 get '/search', to: 'search#index'

end