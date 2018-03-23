Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'pages#home', to: 'pages#home'

  resources :checkouts, only: [:new, :create, :show]

  resources :deliverys, only: [:new, :create, :show]

  resources :submerchants, except: [:destroy]
end
