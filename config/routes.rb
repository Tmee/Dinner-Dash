Rails.application.routes.draw do

  root 'home#index'

  get '/admin', to: 'admin/base_admin#index', as: :admin_index

  resources :home, only: [:index]

  namespace :admin do
    resources :items, :fillings, :users
  end

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/menu',      to: 'menu#index'
  get '/register',  to: 'users#new'

  get '/menu_item_builder/*', to: 'menu#menu_item_builder'
end
