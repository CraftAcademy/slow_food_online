def create_restaurant_categories(rest_cats)
  rest_cats.each do |category|
    RestaurantCategory.create(title: category)
  end
end