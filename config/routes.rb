Rails.application.routes.draw do
  root 'lifes#index'
  get 'contents/edit'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :lifes do
    resources :contents
  end
end
