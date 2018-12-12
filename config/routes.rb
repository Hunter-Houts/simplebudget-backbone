Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :posts, defaults: {format: :json}
  root to: "main#index"
  constraints defaults: {format: 'json'} do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    post 'logout' => 'sessions#destroy'
    get 'signup' => 'users#new'
    post 'signup' => 'users#create'
    get 'profile' => 'users#show'
    get 'posts' => 'posts#index'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
