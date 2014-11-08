Feature: Logging In

Scenario: View Login
    Given I am on the home page
        And I am logged out
    When I click the login link
    Then I should see the login page

Scenario Outline: Login Success
    Given I am on the login page
    When I enter email <email>
        And I enter password <password>
        And I click the login button
    Then I should see a flash message
    Examples: 
        | email                         | password      |
        | admin@silverandstones.gallery | administrator |

Scenario Outline: Login Failure
    Given I am on the login page
    When I enter email <email>
        And I enter password <password>
        And I click the login button
    Then I should see a failure message
    Examples: 
        | email             | password |
        | admin@example.com | blahblah |