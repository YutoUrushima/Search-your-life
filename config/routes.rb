Rails.application.routes.draw do
  get 'contents/edit'
#   get 'lifes/index'
#   get 'lifes/show'
#   get 'lifes/new'
#   get 'lifes/edit'

get "/login" => "lifes#login_form"
post "/login" => "lifes#login"
post "/logout" => "lifes#logout"

root 'lifes#index'
resources :lifes do
  resources :contents
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
