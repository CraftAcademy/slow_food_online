Rails.application.routes.draw do
  resources :restaurants, only: [:show]
  #get 'restaurant/:id', controller: :restaurants, action: :show
  resources :dishes
  resources :uploads
  post 'add_to_cart', controller: :dishes, action: :add_to_cart
  devise_for :users, controllers: { registrations: :registrations }
  root 'landing#index'
  get :search_restaurants, controller: :landing, action: :search_restaurants
end
