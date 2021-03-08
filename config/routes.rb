Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  namespace :admin do
      resources :users
      resources :adresses
      resources :carts
      resources :orders
      resources :articles
      resources :items
      resources :cart_items

      root to: "orders#index"
    end

  resources :cart_items, only: [:new, :create, :destroy]
  resources :carts, only: [:show, :new, :destroy]
  resources :items, only: [:show, :index]
  resources :articles, only: [:show, :index, :new]
  # resources :adresses
  resources :orders, only: [:show, :create, :index] do
    resources :payments, only: :new
  end

  resources :contacts, only: [:create, :new]

  resources :users, only: [] do
    resources :adresses, only: [:edit, :update]
  end

  require "sidekiq/web"
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'
  get '/about/', to: 'pages#about'

  mount StripeEvent::Engine, at: '/stripe-webhooks' # provide a custom path

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
