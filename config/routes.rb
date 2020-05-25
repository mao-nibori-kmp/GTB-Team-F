Rails.application.routes.draw do
  resources :test

  get "/banktest" => "test#banktest"
end
