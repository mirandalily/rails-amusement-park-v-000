Rails.application.routes.draw do
  
  resources :users
  resources :rides
  resources :attractions
  root "welcome#index"
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  delete "/signout" => "sessions#destroy"

end
