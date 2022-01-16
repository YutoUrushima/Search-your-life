Rails.application.routes.draw do
  root 'lifes#index'
  get 'contents/edit'
  get "/login", to: "lifes#login_form"
  post "/login", to: "lifes#login"
  post "/logout", to: "lifes#logout"
  
  resources :lifes do
    resources :contents
  end
end
