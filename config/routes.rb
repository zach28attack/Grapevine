Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :diary
  root "home#index"
end
