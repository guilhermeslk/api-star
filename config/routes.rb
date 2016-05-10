Rails.application.routes.draw do
  root "dashboard#index"
  resources :droplets, only: ['update']
end
