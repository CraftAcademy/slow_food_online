Feature: As a visitor
  In order to be able to make a choice of what I want to eat
  I would like to see a list of dishes within a specific menu offered by a restaurant

  Background:
    Given the following categories exist
      | title   |
      | Samoan  |
      | Chinese |
    Given the following restaurants exist
      | name           | category |
      | Calles Kitchen | Samoan   |
      | Pizza Place    | Samoan   |
      | China Palace   | Chinese  |

    Given the following dishes exist
      | name            | menu        | price |
      | Dimsun          | starter     | 80    |
      | Grilled duck    | maincourse  | 140   |
      | Fried banana    | dessert     | 50    |

  Scenario: Show all the dishes and the prices
    Given I am on the "dish list page"
    Then I should see all the dishes
    And I should see all the prices

  Scenario: Show the dish details page
    Given I am on the "dish list page"
    And I click on "Dimsun"
    Then I should be on the "dish detail page" for "Dimsun"
    And I should see "Dimsun"
    And I should see "80"
