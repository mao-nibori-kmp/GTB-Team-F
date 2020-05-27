Rails.application.routes.draw do
  get 'sessions/new'
  resources :test
  resources :users
  get "/banktest" => "test#banktest"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
