Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    get 'scores', to: 'scores#user_feed'
    get '/scores', to: 'scores#index'
    get '/scores/:id', to: 'scores#show_scores'
  end
end
