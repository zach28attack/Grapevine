Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  resources :foods, except: %i[ show ]
  resources :diaries
  resources :meals, only: %i[ index create destroy ]
  resources :foods_meals, only: %i[ new create destroy]
  root "diaries#index"
  get "welcome", to:"welcome#welcome"
end
