Rails.application.routes.draw do
  devise_for :users
  root to: "wishlists#index"
  resources :wishes
  resources :wishlists
end
