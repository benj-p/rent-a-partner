Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:new, :create] do
    member do
      get 'dashboard'
    end
    resources :messages, only: :index
  end
  resources :personalities, only: [:index, :new, :create, :show, :edit] do
    resources :bookings, only: :create
  end

  resources :bookings, only: [:destroy] do
    resources :messages, only: [:new, :create]
  end

  resources :messages, only: [:index, :show]
  resources :reviews, only: [:new, :create, :edit, :update]
end
