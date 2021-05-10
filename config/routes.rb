Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  get 'diaries', to: 'diaries#list'
  resources :feed_managements, only: [:new, :create, :edit, :update]
  resources :diaries
  resources :sessions, only: [:create] 
end
