class LandingController < ApplicationController
  def index
    @restaurant_categories = RestaurantCategory.all
    @restaurants = Restaurant.where(restaurant_category: params[:category]) if params[:category]
  end

  def search_restaurants
    @restaurants = Restaurant.where(restaurant_category: params[:category]) if params[:category]
    render json: {matches: @restaurants}
  end
end
