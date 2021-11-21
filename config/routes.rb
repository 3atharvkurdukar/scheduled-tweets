Rails.application.routes.draw do
  root to: "main#index"
  get "/about-us", to: "about#index", as: :about
  get "/sign-up", to: "registrations#new"
  post "/sign-up", to: "registrations#create"
  get "/sign-in", to: "sessions#new"
  post "/sign-in", to: "sessions#create"
  get "/change-password", to: "passwords#edit"
  patch "/change-password", to: "passwords#update"
  delete "/logout", to: "sessions#destroy"
end
