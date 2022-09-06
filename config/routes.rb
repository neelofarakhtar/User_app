Rails.application.routes.draw do
  devise_for :users
  root  "profile#index"
  resources :users 
  resources :profile

  resources :posts do
    resources :comments, only: %i[new create]
  end

end
