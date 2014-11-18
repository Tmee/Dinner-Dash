Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resources :fillings


  get '/',          to: 'users#index'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  get 'admin/fillings'
  get 'admin/dashboard'

end
