Feature: As a visitor
  So that I can use the service
  I would like to be able to sign up and log in with my email

  Background:
    Given the following users are registered in the system
      | username    | email             |
      | Calle       | calle@gmail.com   |
      | Daniel      | daniel@gmail.com  |

  Scenario: A visitor can register
    Given I am on the "sign up page"
    And I fill in "Username" with "test_user"
    And I fill in "Email" with "visitor@gmail.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Sign up"
    Then I should be on the "home page"

  Scenario: A visitor cannot register with wrong password confirmation
    Given I am on the "sign up page"
    And I fill in "Username" with "test_user2"
    And I fill in "Email" with "visitor2@gmail.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "qqqqqqq"
    And I click "Sign up"
    Then I should see "Password confirmation doesn't match Password"

  Scenario: A visitor cannot register with an existing username
    Given I am on the "sign up page"
    And I fill in "Username" with "Calle"
    And I fill in "Email" with "doubled_user@gmail.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Sign up"
    Then I should see "Username has already been taken"

  Scenario: Email must not be duplicate
    Given I am on the "sign up page"
    And I fill in "Email" with "daniel@gmail.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Sign up"
    Then I should see "Email has already been taken"

  Scenario: Password must not be blank
    Given I am on the "sign up page"
    And I fill in "Email" with "testperson@gmail.com"
    And I fill in "Password" with ""
    And I fill in "Password confirmation" with ""
    And I click "Sign up"
    Then I should see "Password can't be blank"

  Scenario: Email must not be blank
    Given I am on the "sign up page"
    And I fill in "Email" with ""
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Sign up"
    Then I should see "Email can't be blank"

  Scenario: Email must be valid
    Given I am on the "sign up page"
    And I fill in "Username" with "123"
    And I fill in "Email" with "123.123"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Sign up"
    Then I should see "Email is invalid"

  Scenario: Log in successfully with an existing account
    Given I am on the "login page"
    And I fill in "Email" with "calle@gmail.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    Then I should be on the "home page"

  Scenario: Log in failed with wrong password
    Given I am on the "login page"
    And I fill in "Email" with "calle@gmail.com"
    And I fill in "Password" with "wrong_password"
    And I click "Log in"
    Then I should be on the "login page"
