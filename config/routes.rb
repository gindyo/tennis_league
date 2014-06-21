Rails.application.routes.draw do
  resources :ranking_points_entries

  resources :matches

  resources :schedules

  resources :players

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end