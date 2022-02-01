Rails.application.routes.draw do

  root to: 'home#index'
  
  get 'login', to: 'user_sessions#new' 
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: [:new, :create]
  
  namespace :api, {format: 'json'} do
    resources :items, only: [:index, :create, :show, :update, :destroy]
  end
  
 get '*path', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
