Feature: As a visitor
  So that I can order food that I feel like eating
  I would like to access a page that allows me to make a choice of different restaurants


  Background:
    Given the following categories exist
      | title          |
      | Samoan         |
      | Chinese        |
      | Empty Category |

    Given the following restaurants exist
      | name             | category | latitude   | longitude  |
      | Calles Kitchen   | Samoan   | 59.3716664 | 18.2061587 |
      | Pizza Place      | Samoan   | 59.1159593 | 18.2529808 |
      | China Palace     | Chinese  | 59.1151555 | 18.2538833 |
      | Gbg China Palace | Chinese  | 57.6920410 | 11.9592070 |
      | Gbg Samoan       | Samoan   | 57.6927300 | 11.9557350 |

  Scenario:
    Given I am on the "home page"
    Then I should see "What do you feel like tonight?"


  @javascript
  Scenario: Choose Empty Category in Stockholm
    Given I am on the "home page"
    And my location is "Stockholm"
    And I wait for the Google map to load
    When I select "Empty Category" from "category"
    Then I should see "No matches were found"

  @javascript
  Scenario: Choose Empty Category in Gothenburg
    Given I am on the "home page"
    And my location is "Gothenburg"
    And I wait for the Google map to load
    When I select "Empty Category" from "category"
    Then I should see "No matches were found"

  @javascript
  Scenario: Choose Samoan in Stockholm
    Given I am on the "home page"
    And my location is "Stockholm"
    And I wait for the Google map to load
    When I select "Samoan" from "category"
    Then I should see "Samoan joints near you"
    And I should see "Calles Kitchen"
    And I should see "Pizza Place"
    And I should not see "Gbg Samoan"

  @javascript
  Scenario: Choose Samoan in Gothenburg
    Given I am on the "home page"
    And my location is "Gothenburg"
    And I wait for the Google map to load
    When I select "Samoan" from "category"
    Then I should see "Samoan joints near you"
    And I should see "Gbg Samoan"
    And I should not see "Calles Kitchen"
    And I should not see "Pizza Place"


  @javascript
  Scenario: Choose Chinese in Stockholm
    Given I am on the "home page"
    And my location is "Stockholm"
    And I wait for the Google map to load
    When I select "Chinese" from "category"
    Then I should see "Chinese joints near you"
    And I should see "China Palace"
    And I should not see "Gbg China Palace"

  @javascript
  Scenario: Choose Chinese in Gothenburg
    Given I am on the "home page"
    And my location is "Gothenburg"
    And I wait for the Google map to load
    When I select "Chinese" from "category"
    Then I should see "Chinese joints near you"
    And I should not see "China Palace"
    And I should see "Gbg China Palace"


  Scenario: Display address input
    Given I am on the "home page"
    Then I should see the "pac-input"
