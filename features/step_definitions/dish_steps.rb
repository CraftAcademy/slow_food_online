Given(/^the following dishes exist$/) do |table|
  table.hashes.each do |dish|
    FactoryGirl.create(:dish, name: dish[:name], price: dish[:price])
  end
end

Given(/^the dish Dimsun exist$/) do
  FactoryGirl.create(:dish, name: 'Dimsun', price: '90',
                     allergy_info: 'soy', calories: '120')
end

Then(/^I should see all the dishes$/) do
  steps %Q{
    Then I should see "Dimsun"
    Then I should see "Grilled duck"
    Then I should see "Fried banana"
  }
end

Then(/^I should see all the prices$/) do
  steps %Q{
    Then I should see "80"
    Then I should see "140"
    Then I should see "50"
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
