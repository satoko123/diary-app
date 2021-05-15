Rails.application.routes.draw do
  devise_for :users
  resources :feed_managements, only: [:new, :create, :edit, :update]
  root to: "diaries#index"
  get 'diaries', to: 'diaries#list'
  resources :diaries, except: [:index]
  get 'shopping_lists', to: 'shopping_lists#index'
end
