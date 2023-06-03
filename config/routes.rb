Rails.application.routes.draw do

 resources :users

 get "/plants" => "plants#index"
 
end
