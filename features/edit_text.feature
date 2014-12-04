Feature: Edit Site Text

Scenario: Edit Site Description
  Given I am logged in as an admin
  When I go to the home page
    And I click the edit text button above the site description
    And I enter new content
    And I click the update button
  Then the site description should be updated

Scenario: Edit About Us
  Given I am logged in as an admin
  When I go to the about us page
    And I click the edit text button above Our Passion
    And I enter a new title
    And I enter new content
    And I click the update button
  Then the about us page should be updated
