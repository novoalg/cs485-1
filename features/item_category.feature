Feature: Item Categories

Scenario: Create an Item Category
	Given I am logged in as an admin
	When I go to the new category page
		And I enter Things as the category name
		And I enter Stuff as the category description
		And I save the category
	Then I should see Things in the item category list
	
Scenario: Create an Invalid Item Category
	Given I am logged in as an admin
	When I go to the new category page
		And I enter Stuff as the category description
		And I save the category 
	Then I should see a descriptive error message

Scenario: View a Category
	Given I am logged in as an admin
	When I view the Things category
	Then I should see the category name

Scenario: Modify A Category
	Given I am logged in as an admin
	When I edit the Things category
	Then I should see the category name
