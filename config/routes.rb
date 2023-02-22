Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :diaries
  root "home#index"
end
