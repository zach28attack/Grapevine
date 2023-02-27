Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  resources :foods
  resources :diaries
  resources :meals, only: %i[ new create destroy index ]
  resources :foods_meals
  root "diaries#index"
  get "welcome", to:"welcome#welcome"
end
