Feature: As a visitor, when I have made my selection
  In order to be able to choose a restaurant to order my food from
  I would like a list with restaurants in my proximity to be displayed on the page.

  Background:
    Given the following categories exist
      | title   |
      | Samoan  |
      | Chinese |

    Given the following restaurants exist
      | name             | category | latitude   | longitude  |
      | Calles Kitchen   | Samoan   | 59.3716664 | 18.2061587 |
      | Pizza Place      | Samoan   | 59.1159593 | 18.2529808 |
      | China Palace     | Chinese  | 59.1151555 | 18.2538833 |

  @javascript
  Scenario: Choose Chinese
    Given I am on the "home page"
    And I select "Chinese" from "category"
    Then I should see link "China Palace"
    When I click the "China Palace" link
    Then I should be on the show page for "China Palace"
