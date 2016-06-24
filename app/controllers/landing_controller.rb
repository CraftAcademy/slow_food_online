class LandingController < ApplicationController
  def index
    @restaurant_categories = RestaurantCategory.all
  end

  def search_restaurants
    # Restaurant.near([lat, lng], 20).size
    lat, lng = 59.3293235, 18.0685808
    @restaurants = Restaurant.near([lat, lng], 20).where(restaurant_category: params[:category])
    render json: {matches: @restaurants}
  end
end
