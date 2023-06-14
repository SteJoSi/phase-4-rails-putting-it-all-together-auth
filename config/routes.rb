Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Sign-up feature
  post "/signup", to: "users#create"
  # Auto-login feature
  get "/me", to: "users#show"
  # Login after sign up
  post "/login", to: "sessions#create"
  # Logout after login
  delete "/logout", to: "sessions#destroy"

  # recipes view and create
  resources :recipes, only: [:index, :create]
end
