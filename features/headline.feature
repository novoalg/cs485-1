Feature: Headline

Scenario: Turn Headline On
  Given I am logged in as an admin
  When I click headline in the header
    And I enter a test message
    And I set it to active
    And I click update
  Then I should see the headline on the home page

Scenario: Turn Headline Off
  Given I am logged in as an admin
  When I click headline in the header
    And I set it to not active
    And I click update
  Then I should not see the headline on the home page
