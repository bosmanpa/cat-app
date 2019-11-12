Rails.application.routes.draw do
  # resources :cat_tags
  resources :tags
  resources :cat_reviews
  resources :renter_reviews
  resources :reservations
  resources :cats
  resources :users
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/login', to: 'sessions#new', as: :login
delete '/logout', to: 'sessions#destroy', as: :logout
end
