Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Users and sessions
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # Адмін-панель
  namespace :admin do
    resources :users, only: %i[new create]
    get 'dashboard', to: 'dashboard#index'
  end


  # Root route
  root "home#index" # або root "user#new", залежно від потреби
end
