Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    end
  resources :blogs
  resources :users, only: [:show, :edit, :update] do
    resources :events 
      end
    end