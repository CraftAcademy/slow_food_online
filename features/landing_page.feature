Feature: As a visitor
  So that I can order food that I feel like eating
  I would like to access a page that allows me to make a choice of different restaurants


  Background:
    Given the following categories exist
      | title   |
      | Samoan  |
      | Chinese |

    Given the following restaurants exist
      | name           | category | latitude   | longitude  |
      | Calles Kitchen | Samoan   | 59.3716664 | 18.2061587 |
      | Pizza Place    | Samoan   | 59.1159593 | 18.2529808 |
      | China Palace   | Chinese  | 59.0111555 | 18.3138833 |

  Scenario:
    Given I am on the "home page"
    Then I should see "What do you feel like tonight?"

  @javascript
  Scenario: Choose Samoan
    Given I am on the "home page"
    When I select "Samoan" from "category"
    Then I should see "Samoan joints near you"
    And I should see "Calles Kitchen"
    And I should see "Pizza Place"

  @javascript
  Scenario: Choose Chinese
    Given I am on the "home page"
    When I select "Chinese" from "category"
    Then I should see "Chinese joints near you"
    And I should see "China Palace"

#  @javascript
#  Scenario: See map
#    Given I am on the "home page"
#    And I should see "3" markers

  Scenario: Display address input
    Given I am on the "home page"
    Then I should see the "pac-input"
