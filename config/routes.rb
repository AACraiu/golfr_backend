Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    get 'user/:id', to: 'users#show'
    get 'user/:id/scores', to: 'users#scores'
    resources :scores, only: %i[create destroy]
  end
end
