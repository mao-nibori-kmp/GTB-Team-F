Rails.application.routes.draw do
  # resources :test

  get "/test/banktest" => "test#banktest"
end
