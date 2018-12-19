class XHRConstraint
  def matches?(request)
    !request.xhr? && !(request.url =~ /\.json$/ && ::Rails.env == 'development')
  end
end
Rails.application.routes.draw do
  get '*path' => 'main#index', :constraints => XHRConstraint.new #This is gold.
  resources :sessions
  resources :users
  resources :posts
  # resources :reviews
  root to: "main#index"
  # scope contraints: {format: /html/} do
  #   get '*path', to: "main#index"
  # end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'profile' => 'users#show'
  get 'posts' => 'posts#index'
  get 'reviews' => 'reviews#index'
  get 'reviews/create' => 'reviews#new'
  post 'reviews' => 'reviews#create'
  get 'reviews/:id' => 'reviews#show'
  post 'reviews/:id' => 'reviews#update'
  get 'posts/create' => 'posts#new'
  post 'posts/create' => 'posts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
