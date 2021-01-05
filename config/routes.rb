Rails.application.routes.draw do

  # resources :bookmarks
  # resources :todos do
  #   resources :items
  # end
  namespace :api do
    namespace :auth do
      post 'users/check_auth_token', to: 'users#check_auth_token'
      post 'users/check_token_outside', to: 'users#check_token_outside'
      post 'login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
      get 'users/index', to: 'users#index'
      get 'users/:id', to: 'users#show', as: 'user'
      put 'users/:id/update', to: 'users#update'
      post 'users/:id/updateavatar', to: 'users#updateavatar'
      resources :password_resets, only: [:new, :create, :edit, :update], param: :token
    end
  end
  # diaries :users

  # post 'todos/:id/add_user', to: 'todos#add_user'
  # get 'todos/:id/users', to: 'todos#users'
  #
  # resources :diaries

end
