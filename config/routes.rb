Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  # resources :sessions, only: [:create]
  # resources :registrations, only: [:create]
  # resources :users, only: [:show, :destroy]
  # post '/users', to: "registrations#create"

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :appointments
      end
      resources :cleaners do
        resources :appointments
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
