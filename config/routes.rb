Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'users', to: 'users#get_users'
    get 'feed', to: 'scores#user_feed'
    get 'golfers/:id', to: 'scores#golfers'
    resources :scores, only: %i[create destroy]
  end
end
