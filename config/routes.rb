Rails.application.routes.draw do
  resources :cat_tags
  resources :tags
  resources :reviews
  resources :reservations
  resources :cats
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
