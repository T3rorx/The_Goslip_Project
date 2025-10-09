Rails.application.routes.draw do
  root "pages#home"
  resources :gossips
  resources :users
  get "pages/team"
  get "/contact", to: "pages#contact"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
end
