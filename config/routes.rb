Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  # User registration
  post '/signup', to: 'users#create'

  # User login
  post '/login', to: 'sessions#create'

  # User logout
  delete '/logout', to: 'sessions#destroy'
  
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
