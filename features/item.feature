Feature: Items

Scenario Outline: Create an Item
    Given I am logged in as an admin
        And I am on the item creation page
    When I enter name <name>
        And I enter description <description>
        And I enter price <price>
        And I enter stock <stock>
        And I enter category <category>
        And I enter active <active>
        And I enter deleted <deleted>
        And I click the create button
    Then I should see a success message
    Examples: 
        | name       | description | price    | stock  | category | active | deleted |
        | TestItem 1 | A test      | 1.00     | 10     | 1        | true   | false   |
        | TestItem 2 | A test two  | 10000.00 | 100000 | 2        | true   | false   |

Scenario Outline: Create an Invalid Item
    Given I am logged in as an admin
        And I am on the item creation page
    When I enter name <name>
        And I enter description <description>
        And I enter price <price>
        And I enter stock <stock>
        And I enter category <category>
        And I enter active <active>
        And I enter deleted <deleted>
        And I click the create button
    Then I should see an error message
    Examples: 
        | name       | description | price        | stock     | category | active | deleted |
        | TestItem 1 | A test      | -1.00        | -300      | -1       | true   | false   |
        | TestItem 2 | A test two  | 100000001.00 | 100000001 | 2346436  | true   | false   |

Scenario: View An Item
    Given I am logged in
        And I click on the items link
    When I click on an item
    Then I should see the item details

Scenario: Modify An Item
    Given I am logged in as an admin
        And I am on the item page
    When I click the edit button
        And I modify the name field
        And I modify the price field
        And I click the save button
    Then I should see a success message

Scenario: Delete An Item
    Given I am logged in as an admin
        And I am on the item page
    When I click the delete button
    Then I should see a success message