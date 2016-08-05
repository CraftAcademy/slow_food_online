Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :ping, only: [:index], constraints: {format: /(json)/}
    end
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
        sessions: 'overrides/sessions'
      }
      get 'restaurants', controller: :restaurants, action: :index, as: :restaurants
      get 'categories', controller: :categories, action: :index, as: :categories
      get 'dishes', controller: :dishes, action: :index, as: :dishes
    end
  end
  resources :restaurants, only: [:show]
  resource :checkout, only: [:show]
  post 'checkout', controller: :checkouts, action: :checkout
  #get 'restaurant/:id', controller: :restaurants, action: :show
  resources :dishes
  post 'add_to_cart', controller: :dishes, action: :add_to_cart
  devise_for :users, controllers: { registrations: :registrations }
  root 'landing#index'
  get :search_restaurants, controller: :landing, action: :search_restaurants
end
