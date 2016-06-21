class LandingController < ApplicationController
  def index
    @restaurant_categories = RestaurantCategory.all
    @restaurants = Restaurant.where(restaurant_category: params[:category]) if params[:category]
  end

  def search_restaurants
    redirect_to action: :index, category: params[:category]
  end
end
