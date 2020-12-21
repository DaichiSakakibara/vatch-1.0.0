Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:index, :edit, :show]  #do
  get 'search', to: 'users#search'
  #   collection do
  #     get 'search'
  #   end
  # end
  resources :posts do
    resource :like_posts,only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
