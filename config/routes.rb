Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :items

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/', to: 'layouts#application'



end
