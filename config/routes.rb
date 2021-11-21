Rails.application.routes.draw do
  root to: "main#index"
  get "/about-us", to: "about#index", as: :about

  get "/sign-up", to: "registrations#new"
  post "/sign-up", to: "registrations#create"

  get "/sign-in", to: "sessions#new"
  post "/sign-in", to: "sessions#create"

  get "/change-password", to: "passwords#edit"
  patch "/change-password", to: "passwords#update"

  get "/forgot-password", to: "reset_passwords#new"
  post "/forgot-password", to: "reset_passwords#create"
  get "/reset-password", to: "reset_passwords#edit"
  patch "/reset-password", to: "reset_passwords#update"

  delete "/logout", to: "sessions#destroy"
end
