Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [ :new, :create, :show]
  end
  resources :bookings, only: [ :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'profile', to: 'pages#profile'
end
