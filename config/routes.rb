Rails.application.routes.draw do

  root 'home#index'

  get '/admin', to: 'admin/base_admin#index', as: :admin_index

  resources :users
  resources :orders, only: [:index, :new, :show, :create]

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

  get '/code', to: 'application#code'
  get '/menu_item_builder/*', to: 'menu#build_item'

  get  '/build', to: 'line_items#new'
  get '/build_temp/:id', to: 'menu#build_temp'

  post '/build_temp', to: 'cart#create'
  post  '/cart', to: 'cart#update_quantity'
  delete '/cart', to: 'cart#remove_item' 

  resources :cart, only: [:index]
  
end
