Feature: Logging In

Scenario: View Login
    Given I am on the home page
        And I am logged out
    When I click the login link
    Then I should see the login page

Scenario: Login Success
    Given I am on the login page
    When I enter email admin@silverandstones.gallery
        And I enter password administrator
        And I click the login button
    Then I should see a flash message

Scenario: Login Failure
    Given I am on the login page
    When I enter email admin@example.com
        And I enter password blahblah
        And I click the login button
    Then I should see a failure message
