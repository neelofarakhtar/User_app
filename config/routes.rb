Rails.application.routes.draw do
  # get 'follow_user', to: 'relationships#follow_user', as: :follow_user
  # get 'unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  devise_for :users
  root  "profile#index"
  resources :users do 
    resources :relationships, only: [:create, :destroy]
  end
  # resources :relationships, only: [:destroy]
  resources :profile

  resources :posts do
    resources :comments, only: %i[new create]
  end

end
