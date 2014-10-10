Feature: Static Pages

Scenario: View Homepage
    When I go to the homepage
    Then I should see the homepage

Scenario: View About Us
    Given I am on the homepage
        And I click the about us link
    Then I should see the about us page

Scenario: View Contact Us
    Given I am on the homepage
        And I click the contact us link
    Then I should see the contact us page

Scenario: Get Directions
    Given I am on the contact us page
        And I click the get directions button
    Then I should see the google maps page

Scenario: View Login
    Given I am on the homepage
        And I click the login link
    Then I should see the login page

Scenario Outline: Login Success
    Given I am on the login page.
        And I enter username <username>
        And I enter password <password>
        And I click the login button
    Then I should see the welcome message
    Examples: 
        | username | password |
        | admin    | admin    |

Scenario Outline: Login Failure
    Given I am on the login page.
        And I enter username <username>
        And I enter password <password>
        And I click the login button
    Then I should see the failure message
    Examples: 
        | username | password |
        | admin    | blahblah |