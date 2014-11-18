Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :items


  get '/',          to: 'users#index'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
