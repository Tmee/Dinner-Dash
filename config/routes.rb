Rails.application.routes.draw do

  root 'users#home'

  resources :users
  resources :fillings


  get '/',          to: 'users#home'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register',  to: 'users#new'

  get '/menu_item_builder/*', to: 'menu#menu_item_builder'




  get 'admin/fillings'
  get 'admin/dashboard'

end

