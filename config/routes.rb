Rails.application.routes.draw do
  root "dashboard#index"
  get "/actions/check", to: 'actions#check_pending'

  resources :droplets, only: ['update', 'index']
end
