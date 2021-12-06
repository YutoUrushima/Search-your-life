Rails.application.routes.draw do
#   get 'lifes/index'
#   get 'lifes/show'
#   get 'lifes/new'
#   get 'lifes/edit'

root "lifes#index"
resources :lifes

get "/login" => "lifes#login_form"
post "/login" => "lifes#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
