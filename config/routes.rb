Rails.application.routes.draw do
  get 'sessions/new'
  root 'lifes#index'
  get 'contents/edit'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  
  resources :lifes do
    resources :contents
  end
end
