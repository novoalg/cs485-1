Feature: User Modification

Scenario: Create User
    Given I am logged in 
    When I go to the new user page
        And I fill in user details
        And I click the submit button
    Then I should see a success message

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

Scenario: Delete User
    Given I am on the user page
        And I am logged in
    When I click the delete profile button
    Then I should see the home page
        And The user should no longer exist