Rails.application.routes.draw do

  root 'users#home'

  resources :users
  resources :fillings


  get '/',          to: 'users#home'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/menu_item_builder/*', to: 'menu#menu_item_builder'

  get '/menu', to: 'menu#menu_items'


  get 'admin/fillings'
  get 'admin/dashboard'

end

