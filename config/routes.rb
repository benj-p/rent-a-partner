Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:new, :create] do
    member do
      get 'dashboard'
    end
    resources :personalities, only: [:show] do
      resources :booking, only: [:new, :create]
    end
  end
  resources :personalities, only: [:index, :new, :create, :show, :edit]
end
