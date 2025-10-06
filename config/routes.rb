Rails.application.routes.draw do
  get "/static_pages/contact", to: 'static_pages#contact'
  get "up" => "rails/health#show", as: :rails_health_check

end
