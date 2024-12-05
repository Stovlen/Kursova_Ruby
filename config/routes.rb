Rails.application.routes.draw do
  get 'carts/show'
  get 'carts/add'
  get 'carts/remove'
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

  get '/cart', to: 'carts#show', as: :cart
  post '/cart/add/:product_id', to: 'carts#add', as: :add_to_cart
  delete '/cart/remove/:product_id', to: 'carts#remove', as: :remove_from_cart

  delete '/cart/clear', to: 'carts#clear', as: :clear_cart

  patch '/cart/update/:product_id', to: 'carts#update_quantity', as: :update_cart_quantity

  resources :products do
    resources :reviews, only: [:create]
  end

  get '/search', to: 'products#search', as: :search_products

  get '/checkout', to: 'orders#new', as: :checkout
  post '/checkout', to: 'orders#create'

  # get '/orders/branches', to: 'orders#branches'

  get '/about', to: 'pages#about', as: :about
  get '/contact', to: 'pages#contact', as: :contact
  get '/privacy', to: 'pages#privacy', as: :privacy

  get '/feedback', to: 'feedbacks#new', as: :feedback
  post '/feedback', to: 'feedbacks#create'

  # Адмін-панель
  namespace :admin do
    get '/dashboard', to: 'dashboard#index', as: :dashboard
    resources :users, only: [:new, :create]
    resources :feedbacks, only: [:index]
    resources :reviews, only: [:update]
    resources :orders, only: [:index, :show]
  end

  resources :payments, only: [:new, :create]
  get '/payment/success', to: 'payments#success', as: :payment_success

  resources :orders, only: [:new, :create]


end
