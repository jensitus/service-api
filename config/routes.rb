Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :todos do
    resources :items
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/index', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  # resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
end
