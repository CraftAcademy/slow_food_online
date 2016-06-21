module ApplicationHelper


  def categories_for_select
    collection = []
    RestaurantCategory.all.each do |category|
      collection << [category.title, category.id]
    end
    collection
  end
end
