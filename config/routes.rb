Rails.application.routes.draw do

  devise_for :admins
 
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/collect'

  get 'static_pages/donate'

  get 'static_pages/support'

  root 'static_pages#home'
  
  resources :hotspots, only: [:new, :create, :edit, :update, :destroy, :index]
end