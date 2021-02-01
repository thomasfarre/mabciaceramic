Rails.application.routes.draw do

  resources :cart_items
  resources :carts
  resources :items
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  devise_for :users, controllers: {
        registrations: 'registrations'
  }

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
