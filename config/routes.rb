Rails.application.routes.draw do

  root 'home#index'

  resources :users
  resources :admin, only: [:index]
  resources :home, only: [:index]

  scope 'admin' do
    resources :items, :fillings
    get   '/menu',   to: "admin#menu"
  end

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/menu',      to: 'items#menu_items'
  get '/register',  to: 'users#new'

  get '/menu_item_builder/*', to: 'menu#menu_item_builder'
end
