Feature: Item Categories

Scenario Outline: Create an Item Category
    Given I am logged in as an admin
        And I am on the item category page
    When I enter name <name>
        And I enter active <active>
        And I enter deleted <deleted>
        And I click the create button
    Then I should see a success message
    Examples: 
        | name       | active | deleted |
        | Category 1 | true   | false   |
        | Category 2 | true   | false   |

Scenario Outline: Create an Invalid Item Category
    Given I am logged in as an admin
        And I am on the item category page
    When I enter active <active>
        And I enter deleted <deleted>
        And I click the create button
    Then I should see an error message
    Examples: 
        | active | deleted |
        | true   | false   |
        | true   | false   |

Scenario: View a Category
    Given I am logged in as an admin
        And I click on an item category
    Then I should see the items in that category

Scenario: Modify A Category
    Given I am logged in as an admin
        And I am on the item category page
    When I click the edit button
        And I modify the name field
        And I click the save button
    Then I should see a success message

Scenario: Delete A Category
    Given I am logged in as an admin
        And I am on the item category page
    When I click the delete button
    Then I should see a success message