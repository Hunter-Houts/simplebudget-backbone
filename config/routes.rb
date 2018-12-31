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
  resources :bills
  resources :accounts
  resources :comments
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
  get 'profile' => 'users#index'
  get 'posts' => 'posts#index'
  get 'posts/:id/edit' => 'posts#show'
  put 'posts/:id/edit' => 'posts#update'
  post 'posts/:id/delete' => 'posts#destroy'
  get 'reviews/:id' => 'reviews#show'
  get 'reviews' => 'reviews#index'
  get 'reviews/create' => 'reviews#new'
  post 'reviews' => 'reviews#create'
  put 'reviews/:id' => 'reviews#update'
  get 'posts/create' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get '/account-setup' => 'accounts#new'
  post '/account-setup' => 'accounts#create'
  put '/accounts' => 'accounts#update'
  post '/addBill' => 'bills#create'
  get '/bills/:id' => redirect('/account-setup')
  post '/bills/:id' => 'bills#destroy'
  patch '/users/:id' => 'users#update'
  get 'comments/:id/replies' => 'comments#index'
  get 'comments' => 'comments#new'
  post 'comments' => 'comments#create'
  post 'comments/:id' => 'comments#update'
  post 'comments/:id/delete' => 'comments#destroy'
  post 'reply/:comment_id/:post_id' => 'comments#reply'
  post 'reply/:id/:post_id/edit' => 'comments#update'
  post 'reply/:id/:post_id/delete' => 'comments#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
