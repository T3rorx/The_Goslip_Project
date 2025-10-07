Rails.application.routes.draw do
  root "pages#home"
  get "/gossip/:id", to: 'gossip#gossip'
  get "/user_profile/:id", to: 'user_profile#user_profile'
  get "pages/team"
  get "/contact", to: "pages#contact"
  get "up" => "rails/health#show", as: :rails_health_check
end
