Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  
  get 'login', to: 'user_sessions#new' 
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  root to: 'home#index'
  
  namespace :api do
    resources :items
  end
  
 get '*path', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
