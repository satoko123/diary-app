Rails.application.routes.draw do
  get 'diaries/index'
  devise_for :users
  root to: "diaries#index"
  resources :feed_managements, only: [:new, :create]
end
