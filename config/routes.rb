Rails.application.routes.draw do
  resources :test
  resources :users
  get "/banktest" => "test#banktest"
end
