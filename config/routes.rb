Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  root 'landing#index'
  post :search_restaurants, controller: :landing, action: :search_restaurants
end
