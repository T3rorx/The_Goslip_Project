Rails.application.routes.draw do
  get "pages/team"
  get "/contact", to: 'pages#contact'
  get "up" => "rails/health#show", as: :rails_health_check

end
