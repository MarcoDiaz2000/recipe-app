# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
  get 'home/index'
  root 'home#index'

  resources :users, only: [:index, :show, :destroy]
  resources :foods, only: [:new, :create, :index, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    member do
      patch :toggle_public
      get :shopping_list
    end
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'general_shopping_lists', to: 'shopping_lists#index', as: 'general_shopping_lists'
end
