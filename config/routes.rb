Rails.application.routes.draw do
  get '/users', to: 'users#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  get '/user', to: 'users#all'
  post '/signup',  to: 'users#create'
  get '/new_event', to: 'events#new'
  post '/new_event', to: 'events#create'
  get '/dashboard', to: 'events#dashboard'
  get '/events', to: 'events#index'
  get '/event', to: 'events#show'
  get 'invitations', to: 'events#friends'
  get '/event_created', to: 'attendances#new'
  post '/event_created', to: 'attendances#create'
  #resources :events, only: [:create, :destroy, :show]
  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
