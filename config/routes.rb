Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :edit, :show]
  resources :posts, only: [:index, :new, :create]
end
