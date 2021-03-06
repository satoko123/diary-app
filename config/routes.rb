Rails.application.routes.draw do
  devise_for :users
  resources :feed_managements, only: [:new, :create, :edit, :update]
  root to: "diaries#index"
  get 'diaries', to: 'diaries#list'
  get 'weight', to: 'diaries#weight'
  resources :diaries, except: [:index] do
    member do
      get 'image_destroy'
    end
  end
  resources :shopping_lists, only: [:index, :create]
  delete 'shopping_lists', to: 'shopping_lists#order'
end
