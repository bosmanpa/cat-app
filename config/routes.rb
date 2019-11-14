Rails.application.routes.draw do
  # resources :cat_tags
  resources :tags
  get 'reservations/:id/cat_review/new', to: 'cat_reviews#new', as: :new_cat_review
  resources :cat_reviews, only: [:show, :create]
  get 'reservations/:id/renter_review/new', to: 'renter_reviews#new', as: :new_renter_review
  resources :renter_reviews, only: [:show, :create]
  get '/', to: 'cats#homepage', as: :homepage 
  get 'cats/search/tags/:tag', to: 'cats#tagsearch', as: :tag_search
  post 'cats/search', to: 'cats#search'
  resources :cats
  get 'cats/:id/reservation/new', to: 'reservations#new', as: :new_reservation
  resources :reservations
  get 'users/my_profile', to: 'users#myprofile', as: :my_profile
  resources :users
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
end
