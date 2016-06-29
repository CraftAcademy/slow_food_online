Given(/^the following menus exist$/) do |table|
  table.hashes.each do |menu|
    restaurant = Restaurant.find_by(name: menu[:restaurant_name])
    FactoryGirl.create(:menu,
                       name: menu[:name],
                       id: menu[:id],
                       restaurant_id: restaurant[:id])
  end
end

Given(/^the following dishes exist$/) do |table|
  table.hashes.each do |dish|
    FactoryGirl.create(:dish,
                       name: dish[:name],
                       price: dish[:price],
                       menu_id: dish[:menu_id])
  end
end

Given(/^the dish Dimsun exist$/) do
  FactoryGirl.create(:dish,
                     name: 'Dimsun',
                     price: '90',
                     allergy_info: 'soy',
                     calories: '120')
end

Then(/^I should see all the dishes$/) do
  steps %q{
    Then I should see "Dimsun"
    Then I should see "Soy milk"
  }
end

Then(/^I should see all the prices$/) do
  steps %q{
    Then I should see "80"
    Then I should see "40"
  }
end

Then(/^I should be on the "([^"]*)" for "([^"]*)"$/) do |page, dish_name|
  dish = Dish.find_by(name: dish_name)
  expect(current_path).to eq dish_path(dish)
end

Given(/^I am on the dish detail page for "([^"]*)"$/) do |dish_name|
  dish = Dish.find_by(name: dish_name)
  visit dish_path(dish[:id])
end

Given(/^I am on the "([^"]*)" for menu "([^"]*)"$/) do |page, menu_name|
  menu = Menu.find_by(name: menu_name)
  visit dishes_path(menu: menu)
end
