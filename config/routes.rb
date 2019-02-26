Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:new, :create] do
    member do
      get 'dashboard'
    end
    resources :personalities, only: [:show] do
      resources :bookings, only: [:new, :create]
    end
  end
  resources :personalities, only: [:index, :new, :create, :show, :edit]
  resources :bookings, only: [:destroy]
end
