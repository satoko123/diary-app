Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  resources :feed_managements, only: [:new, :create, :edit, :update]
  resources :diaries
end
