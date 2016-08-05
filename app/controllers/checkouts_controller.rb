class CheckoutsController < ApplicationController
  def show
    @person = current_user
    @order = Order.find_by(user_id: current_user.id)
    @order_items = @order.shopping_cart_items
    get_item_names
  end

  def checkout
    if is_any_field_empty?
      show_error("All the fields must be filled")
    elsif !valid_date?(params[:user][:expiration_date])
      show_error("Date format is invalid. It should be MM/YY.")
    end
  end

  private

  def get_item_names
    @items_names = 'You have ordered: '
    count = 0
    @order_items.each do |order_item|
      dish = Dish.find(order_item.item_id)
      if count == 0
        @items_names = @items_names + dish.name
      else
        @items_names = @items_names + ', ' + dish.name
      end
      count = count + 1
    end
  end

  def is_any_field_empty?
    params[:user][:full_name].length == 0 ||
      params[:user][:phone_number].length == 0 ||
      params[:user][:street].length == 0 ||
      params[:user][:city].length == 0 ||
      params[:user][:zip_code].length == 0 ||
      params[:user][:cardholder].length == 0 ||
      params[:user][:card_number].length == 0 ||
      params[:user][:expiration_date].length == 0 ||
      params[:user][:cvc].length == 0
  end

  def valid_date?(str, format="%m/%Y" )
    Date.strptime(str,format) rescue false
  end

  def show_error(message)
    flash[:error] = message
    redirect_to checkout_path
  end
end
