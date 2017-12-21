Rails.application.routes.draw do

  devise_for :admins, :skip => [:registrations]
 
  get 'static_pages/home'
<<<<<<< HEAD
  
  post 'static_pages/home'
  
  get 'static_pages/about'

  get 'static_pages/collect'

  get 'static_pages/donate'

  get 'static_pages/support'
=======
>>>>>>> 6e7ad111ef6ab7936c2c2658acf7c9cbb268a5ee

  root 'static_pages#home'
  
  resources :hotspots

end