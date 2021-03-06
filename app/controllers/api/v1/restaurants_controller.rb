class Api::V1::RestaurantsController < ApiController
  def index
    category = RestaurantCategory.find_by(title: params[:cat])
    @collection = Restaurant.where(restaurant_category: category)
    render json: { entries: @collection }
  end
end
