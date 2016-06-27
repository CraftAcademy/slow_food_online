Feature: As a visitor
  In order to be able to make a choice of what I want to eat
  I would like to see details of a dish

  Background:
    Given the dish Dimsun exist

  Scenario: Show details for a dish
    Given I am on the dish detail page for "Dimsun"
    Then I should see "Dimsun"
    And I should see "90"
    And I should see "120"
    And I should see "soy"
