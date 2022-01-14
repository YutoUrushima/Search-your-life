Rails.application.routes.draw do
  get 'contents/edit'
  get "/login", to: "lifes#login_form"
  post "/login", to: "lifes#login"
  post "/logout", to: "lifes#logout"
  root 'lifes#index'
  resources :lifes do
    resources :contents
  end
end
