Rails.application.routes.draw do
  root to: "wishes#index"
  resources :wishes
end
