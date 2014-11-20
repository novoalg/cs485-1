Feature: More Items

Scenario: Create an Item
	Given I am logged in as an admin
	When I go to the new item page
		And I fill in some details
		And I click Create Item
	Then the item should show up on the items page

Scenario: Create an Invalid Item
	Given I am logged in as an admin
	When I go to the new item page
		And I click Create Item
	Then I should see a descriptive error message

Scenario: View An Item
	Given I am logged in as an admin
	When I view the item that was created
	Then I should see the name of that item

Scenario: Modify An Item
	Given I am logged in as an admin
	When I edit the item that was created
		And I save the changes
	Then I should see the changes 
