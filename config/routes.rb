Rails.application.routes.draw do
  resources :ranking_points_entries

  resources :matches

  resources :schedules

  resources :players

  root :to => "home#index"

  get "/home/guest"=> "home#guest", as: :guest_home
  get "/dashboard"  => "dashboard#index", as: :dashboard
  get "/maps/show" => "maps#show"
  get "/players/:id/opponents" => "players#opponents", as: :opponents
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :home_courts

end
