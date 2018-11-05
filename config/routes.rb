Rails.application.routes.draw do
  resources :todos do
    resources :items
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/index', to: 'users#index'
end
