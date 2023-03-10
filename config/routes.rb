Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

 # Display all users
  # resources :users 
  
  #display all the post for a specific user
  # get 'users/:user_id/posts', to: 'posts#index', as: 'posts'
  
  #display a user specific post 
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'post'

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
