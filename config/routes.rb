Rails.application.routes.draw do
  root to: 'home#index'
  
  namespace :api, {format: 'json'} do
    resources :users, only: [:create]
    resources :items, only: [:index, :create, :show, :update, :destroy]
    post 'login', to: 'user_sessions#create'
  end
  
  get '*path', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
