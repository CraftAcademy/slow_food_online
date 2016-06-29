Given(/^I am on the show page for "([^"]*)"$/) do |restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
  visit restaurant_path(restaurant)
end
