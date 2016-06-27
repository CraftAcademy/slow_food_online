Feature: As a visitor, when I have made my selection
  In order to be able to choose a restaurant to order my food from
  I would like a list with restaurants in my proximity to be displayed on the page.

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

  @javascript
  Scenario: Choose Chinese
    Given I am on the "home page"
    And I select "Chinese" from "category"
    Then I should see link "China Palace"
    When I click the "China Palace" link
    Then I should be on the show page for "China Palace"
