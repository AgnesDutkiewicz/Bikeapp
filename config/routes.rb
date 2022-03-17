Rails.application.routes.draw do
  namespace :api do
    resources :trips, only: [:create]
  end
end
