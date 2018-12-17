Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :posts
  resources :reviews
  root to: "main#index"
  scope contraints: {format: /html/} do
    get '*path', to: "main#index"
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'profile' => 'users#show'
  get 'posts' => 'posts#index'
  get 'reviews' => 'reviews#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
