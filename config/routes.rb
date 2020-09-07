Rails.application.routes.draw do
  root 'static#home'
  
  #view
  get '/users/', to: 'users#index'
  #view
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users/', to: 'users#create'
  #view
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  #view
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users/:id', to: 'users#show'
  delete '/users/:id', to: 'users#destroy'

  #view
  get '/attractions', to: 'attractions#index', as: 'attractions'
  #view
  get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  post '/attractions', to: 'attractions#create'
  #view
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  #view
  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id', to: 'attractions#update'
  delete '/attractions/:id', to: 'attractions#destroy'

  #view
  get '/signin',  to: 'sessions#new', as: 'sign_in'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  
  post '/rides', to: 'rides#create' , as: 'rides'

end