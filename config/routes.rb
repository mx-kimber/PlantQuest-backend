Rails.application.routes.draw do

 resources :users
 post "/sessions" => "sessions#create"
 
 get "/plants" => "plants#index"
 
end
