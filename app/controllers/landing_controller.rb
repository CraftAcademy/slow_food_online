class LandingController < ApplicationController
  def index
    @restaurant_categories = RestaurantCategory.all
  end

  def search_restaurants
    lat, lng = params[:lat], params[:lng]
    @restaurants = Restaurant.near([lat, lng], 20)
                       .where(restaurant_category: params[:category])
    render json: {matches: @restaurants}
  end
end
