Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'registrations'
      }

  root to: 'pages#home'

  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
