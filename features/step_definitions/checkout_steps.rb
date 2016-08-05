Then(/^I should see all the fields$/) do
  steps %q{
    Then I should see the field "Full Name"
    Then I should see the field "Phone Number"
    Then I should see the field "Street"
    Then I should see the field "City"
    Then I should see the field "Zip Code"
    Then I should see the field "Cardholder"
    Then I should see the field "Card Number"
    Then I should see the field "Expiration Date"
    Then I should see the field "CVC"
  }
end

Given(/^I have added items to the cart$/) do
  steps %q{
    And I am on the "dish list page" for menu "Breakfast"
    And I click "Add to cart" for "Dimsun"
    And I click "Add to cart" for "Soy milk"
    And I click "Add to cart" for "Congee"
  }
end


Given(/^I fill everything except Expiration Date$/) do
  steps %q{
    And I fill in "Full Name" with "Calle Johansson"
    And I fill in "Phone Number" with "0811111111"
    And I fill in "Street" with "Storgatan 1"
    And I fill in "City" with "Stockholm"
    And I fill in "Zip Code" with "121122"
    And I fill in "Cardholder" with "Calle Johansson"
    And I fill in "Card Number" with "12345678"
    And I fill in "CVC" with "222"
  }
end

Given(/^"([^"]*)" have no items in the shopping cart$/) do |name|
  user = User.find_by(username: name)
  order = Order.find_or_create_by(user: user)
  order.clear
end
