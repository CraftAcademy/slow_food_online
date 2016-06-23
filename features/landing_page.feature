Feature: As a visitor
  So that I can order food that I feel like eating
  I would like to access a page that allows me to make a choice of different restaurants


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

  Scenario:
    Given I am on the "home page"
    Then I should see "What do you feel like tonight?"

  @javascript
  Scenario: Choose Samoan
    Given I am on the "home page"
    When I select "Samoan" from "category"
    Then I should see "You have selected Samoan"
    And I should see "Calles Kitchen"
    And I should see "Pizza Place"

  @javascript
  Scenario: Choose Chinese
    Given I am on the "home page"
    When I select "Chinese" from "category"
    Then I should see "You have selected Chinese"
    And I should see "China Palace"

  Scenario: See map
    Given I am on the "home page"
    Then I should see the "map"

  Scenario: Display address input
    Given I am on the "home page"
    Then I should see the "pac-input"
