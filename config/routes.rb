Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resources :fillings

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/', to: 'layouts#application'

  get 'admin/fillings'
  get 'admin/dashboard'


end
