Rails.application.routes.draw do

  devise_for :admins, :skip => [:registrations]
 
  get 'static_pages/home'
  
  post 'static_pages/home'
  
  get 'static_pages/about'

  get 'static_pages/collect'

  get 'static_pages/donate'

  get 'static_pages/support'

  root 'static_pages#home'
  
  resources :hotspots

end