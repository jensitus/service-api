Rails.application.routes.draw do

  post 'users/check_auth_token', to: 'users#check_auth_token'
  resources :todos do
    resources :items
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/index', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  put 'users/:id/update', to: 'users#update'
  post 'users/:id/updateavatar', to: 'users#updateavatar'

  # diaries :users
  resources :password_resets, only: [:new, :create, :edit, :update], param: :token
  post 'todos/:id/add_user', to: 'todos#add_user'
  get 'todos/:id/users', to: 'todos#users'

  resources :diaries

end
