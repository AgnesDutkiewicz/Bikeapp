Rails.application.routes.draw do
  namespace :api do
    resources :trips, only: [:create]

    namespace :stats do
      resources :weekly, only: [:index]
    end
  end
end
