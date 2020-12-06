Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:index, :edit, :show]
  resources :posts do
    resource :like_posts,only: [:create, :destroy]
  end
end
