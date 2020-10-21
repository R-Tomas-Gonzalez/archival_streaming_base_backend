Rails.application.routes.draw do
  resources :game_favorites
  resources :movie_favorites
  resources :users
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  root to: "static#home"
end
