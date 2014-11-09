Feature: User Modification

Scenario: Create User
    Given I am not logged in 
    When I go to the new user page
        And I fill in user details
        And I click sign up
    Then I should see a flash message

Scenario: Create Invalid User
    Given I am not logged in 
    When I go to the new user page
        And I fill in invalid user details
        And I click sign up
    Then I should see a descriptive error message

Scenario: View User
    Given I am logged in 
        And I am on the user page
    Then I should see the user details

Scenario: Edit User
    Given I am logged in
        And I am on the user page
    When I click the edit profile button
        And I change my name
        And I click the submit button
    Then I should see the updated user details

@javascript
Scenario: Delete User
    Given I am logged out
    When I go to the new user page
        And I sign up with dummy user details
    Given I am on the password edit page
    When I click the cancel account button
    Then I should see the home page
        And the user should no longer exist