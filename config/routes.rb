Rails.application.routes.draw do
 get '/users/current', to: 'users#current'
 
 resources :users

 root to: 'welcome#index'

 resources :sessions, only: [:new, :create, :destroy]

 resources :friendships, only: [:create, :update, :destroy]

 resources :itineraries do
     resources :flights
     resources :attractions
     resources :reservations, only: [:show] do 
       resources :comments, only: [:create, :show]
       resources :photos, only: [:create, :show]

     end
     resources :activities, only: [:show] do 
       resources :comments, only: [:create, :show]
       resources :photos, only: [:create, :show]

     end
     resources :meals, only: [:show] do
       resources :comments, only: [:create]
       resources :photos, only: [:create, :show]
     end
     resources :hotels
     resources :restaurants
 end
 resources :reservations, only: [:show] do 
   resources :comments, only: [:create] 
   resources :photos, only: [:create, :show]
 end
 resources :activities, only: [:show] do 
     resources :comments, only: [:create]
     resources :photos, only: [:create, :show]
 end
 resources :meals, only: [:show] do
   resources :comments, only: [:create]
   resources :photos, only: [:create, :show] 
 end

 resources :photos, only: [:create, :show] do
   resources :comments, only:[:create]
 end

 get '/login', to: 'sessions#new'

 get '/logout', to: 'sessions#destroy'

 get '/auth/facebook/callback', to: 'sessions#create'

end