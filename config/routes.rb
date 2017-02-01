Rails.application.routes.draw do  
  root 'pages#home'
  
  resources :portfolios
  resources :abouts
  resources :contacts, only: [:create]

  devise_for :users, controllers: { registrations: "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
