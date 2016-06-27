Given(/^I am on the "([^"]*)"$/) do |page|
  case page
    when 'home page' then
      visit root_path
    when 'login page' then
      visit new_user_session_path
    when 'sign up page' then
      visit new_user_registration_path
    when 'Forgot password page' then
      visit new_user_password_path
    when 'dish list page' then
      visit dishes_path
  end
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_text(text)
end

And(/^I should not see "([^"]*)"$/) do |text|
  expect(page).not_to have_text(text)
end

Then(/^I should see the "([^"]*)"$/) do |id|
  find_by_id(id)
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select(value, from: field)
end


Given(/^the following categories exist$/) do |table|
  table.hashes.each do |category|
    FactoryGirl.create(:restaurant_category, title: category[:title])
  end

end

Given(/^the following restaurants exist$/) do |table|
  table.hashes.each do |restaurant|
    category = RestaurantCategory.find_by(title: restaurant[:category])
    rest = FactoryGirl.build(:restaurant,
    name: restaurant[:name],
    restaurant_category: category,
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude])
    rest.save(validate: false)
  end
end

Then(/^show me the page$/) do
  save_and_open_page
end

When(/^I click "([^"]*)"$/) do |value|
  click_link_or_button(value)
end

When(/^I click the "([^"]*)" link$/) do |link|
  find_link(link).trigger('click')
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  case page
    when 'home page' then
      expect(current_path).to eq root_path
    when 'login page' then
      expect(current_path).to eq new_user_session_path
  end
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

Then(/^I should see link "([^"]*)"$/) do |link|
  expect(page).to have_link link
end

Then(/^I should be on the show page for "([^"]*)"$/) do |name|
  sleep(2)
  restaurant = Restaurant.find_by(name: name)
  expect(page.current_path).to eq restaurant_path(restaurant)
end

Given(/^I click on "([^"]*)"$/) do |component|
  click_link_or_button(component)
end
