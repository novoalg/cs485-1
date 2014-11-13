Feature: Static Pages

Scenario: View Home Page
    When I go to the home page
    Then I should see the home page

Scenario: View About Us
    Given I am on the home page
    When I click the about us link
    Then I should see the about us page

Scenario: View Contact Us
    Given I am on the home page
    When I click the contact us link
    Then I should see the contact us page

Scenario: Get Directions
    Given I am on the contact us page
    When I click the get directions button
    Then I should see the google maps page