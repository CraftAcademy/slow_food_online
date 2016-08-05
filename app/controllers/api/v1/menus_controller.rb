class Api::V1::MenusController < ApiController
  def index
    restaurant = Restaurant.find_by(name: params[:restaurant])
    @menus = Menu.where(restaurant: restaurant)
    render json: { entries: @menus }
  end
end
