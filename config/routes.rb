Rails.application.routes.draw do
  root to: 'home#index'
  
  namespace :api, {format: 'json'} do
    resources :users, only: [:create]
    resources :items, only: [:index, :create, :show, :update, :destroy]
    post 'login', to: 'user_sessions#create'
  end
  
  get '*path', to: 'home#index'
end
