Feature: As a customer
  So that I can complete my purchase
  I would like to be able to enter payment details and delivery adress

  Background:
    Given the following users are registered in the system
      | username    | email             |
      | Calle       | calle@gmail.com   |

      Given the following categories exist
        | title   |
        | Chinese |

      Given the following restaurants exist
        | name           | category |
        | China Palace   | Chinese  |

      Given the following menus exist
        | name              | id   |  restaurant_name |
        | Breakfast         | 1    |  China Palace    |

      Given the following dishes exist
        | name            | price | menu_id |
        | Dimsun          | 80    | 1       |
        | Soy milk        | 40    | 1       |
        | Congee          | 75    | 1       |

  Scenario: Display all the fields in checkout form
    Given I am logged-in as "Calle"
    And I have added items to the cart
    And I am on the "checkout page"
    Then I should see all the fields

  Scenario: Input expiration date should be valid
    Given I am logged-in as "Calle"
    And I have added items to the cart
    And I am on the "checkout page"
    And I fill everything except Expiration Date
    And I fill in "Expiration Date" with "22/22"
    And I click on "Checkout"
    Then I should see "Date format is invalid. It should be MM/YY."

  Scenario: All the fields must be filled
    Given I am logged-in as "Calle"
    And I have added items to the cart
    And I am on the "checkout page"
    And I click on "Checkout"
    Then I should see "All the fields must be filled"

  Scenario: Display order summary
    Given I am logged-in as "Calle"
    And I have added items to the cart
    And I am on the "checkout page"
    Then I should see "You have ordered: Dimsun, Soy milk, Congee"
    And I should see "Total price: 195.00kr"

  Scenario: Display empty cart message
    Given I am logged-in as "Calle"
    And "Calle" have no items in the shopping cart
    And I am on the "checkout page"
    Then I should see "Your cart is empty"
