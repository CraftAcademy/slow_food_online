Feature: As a restaurant owner
  I want all the images to be stored on AWS
  In order to have access to them remotely

  Scenario: Upload image
    Given I am on the "upload page"
    And I choose a file for upload
    And I click "Create Upload"
    Then I should see "Upload was successfully created."
