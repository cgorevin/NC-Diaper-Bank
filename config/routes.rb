Rails.application.routes.draw do

  devise_for :admins, :skip => [:registrations]
 
  get 'static_pages/home'


  root 'static_pages#home'
  
  resources :hotspots

end