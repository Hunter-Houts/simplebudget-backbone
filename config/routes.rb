Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :posts
  root to: "main#index"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'profile' => 'users#show'
  get 'posts' => 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
