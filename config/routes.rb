Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/welcome', to: 'pages#welcome', as: :welcome
  get '/register', to: 'users#new', as: :register
  delete '/logout', to: 'sessions#destroy', as: :logout

  root "sessions#new" # Головна сторінка — форма входу
end
