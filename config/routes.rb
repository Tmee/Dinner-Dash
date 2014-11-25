Rails.application.routes.draw do

  root 'home#index'

  get '/admin', to: 'admin/base_admin#index', as: :admin_index

  resources :users

  namespace :admin do
    resources :items, :fillings, :users
  end

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/menu', to: 'menu#index'
  resources :menu, only: [:show]


  get  '/register', to: 'users#register'
  post '/register', to: 'users#create'


  get  '/build', to: 'line_items#new'
end
