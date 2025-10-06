Rails.application.routes.draw do
  get 'identifiant/:user_id', to: 'identifiant#show'
  get "/static_pages/contact", to: 'static_pages#contact'
  get "up" => "rails/health#show", as: :rails_health_check
  get "/ask", to: "home#ask"
  post "/go", to: "home#go"
  get "/users/:id", to: "user#show", as: :user
end
