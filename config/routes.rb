Rails.application.routes.draw do
  # Головна сторінка магазину
  root "products#index"

  # Маршрути для продуктів
  resources :products, only: [:index, :show]

  # Реєстрація користувачів
  resources :users, only: [:new, :create]
  get '/register', to: 'users#new', as: :register

  # Авторизація (вхід/вихід)
  resources :sessions, only: [:new, :create, :destroy]
  delete '/logout', to: 'sessions#destroy', as: :logout

  # Сторінка привітання
  get '/welcome', to: 'pages#welcome', as: :welcome
end
