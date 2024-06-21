Rails.application.routes.draw do
  apipie
  resources :movies
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :show, :create, :update, :destroy] do
        member do
          post 'favorite', to: 'movies#favorite'
          delete 'unfavorite', to: 'movies#unfavorite'
        end
      end

      resources :users, only: [:index, :show] do
        member do
          get 'favorite_movies'
        end
      end

      resources :registrations, only: [:create, :destroy] do
        post 'confirm', on: :collection
      end
    
      resources :sessions, only: [:create, :destroy]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'movies#index'
end
