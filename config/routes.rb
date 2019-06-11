Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :users
  root 'tweets#index'
end