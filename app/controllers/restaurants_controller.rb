class RestaurantsController < ApplicationController
  def show
    @rest = Restaurant.find(params[:id])
    @menus = Menu.where(restaurant: @rest)
  end
end
