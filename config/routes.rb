Rails.application.routes.draw do
  resources :hotspots, only: [:new, :create, :edit, :update, :destroy]
end