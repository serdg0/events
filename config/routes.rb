Rails.application.routes.draw do
  get 'attendances/create'

  get 'attendances/index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/new_event', to: 'events#new'
  post '/new_event', to: 'events#create'
  get '/dashboard', to: 'events#index'
  get 'events', to: 'events#show'
  get 'invitations', to: 'events#friends'
  resources :events, only: [:create, :destroy, :show]
  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
