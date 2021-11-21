Rails.application.routes.draw do
  root to: "main#index"
  get "/about-us", to: "about#index", as: :about
  get "/sign-up", to: "registrations#new"
  post "/sign-up", to: "registrations#create"
  delete "/logout", to: "sessions#destroy"
end
