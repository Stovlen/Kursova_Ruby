Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/welcome', to: 'pages#welcome', as: :welcome
  get '/register', to: 'users#new', as: :register
  delete '/logout', to: 'sessions#destroy', as: :logout

  root "products#index" # Призначаємо Головну сторінку
  resources :products, only: [:index, :show] # Маршрути для перегляду продуктів
end
