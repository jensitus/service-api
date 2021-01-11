Rails.application.routes.draw do

  # resources :bookmarks
  # resources :todos do
  #   resources :items
  # end
  # namespace :api do
  #   namespace :auth do
      post 'api/auth/users/check_auth_token', to: 'users#check_auth_token'
      post 'api/auth/users/check_token_outside', to: 'users#check_token_outside'
      post 'api/auth/login', to: 'authentication#authenticate'
      post 'api/auth/signup', to: 'users#create'
      get 'api/auth/users/index', to: 'users#index'
      get 'api/auth/users/:id', to: 'users#show', as: 'user'
      put 'api/auth/users/:id/update', to: 'users#update'
      post 'api/auth/users/:id/updateavatar', to: 'users#updateavatar'
      resources :password_resets, only: [:new, :create, :edit, :update], param: :token
  #   end
  # end
  # diaries :users

  # post 'todos/:id/add_user', to: 'todos#add_user'
  # get 'todos/:id/users', to: 'todos#users'
  #
  # resources :diaries

end
