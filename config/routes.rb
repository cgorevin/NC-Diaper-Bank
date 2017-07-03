Rails.application.routes.draw do
  get 'static_pages/about'

  get 'static_pages/collect'

  get 'static_pages/donate'

  get 'static_pages/support'

  resources :hotspots, only: [:new, :create]
end