Feature: Mailing List

Scenario: Send an Email
  Given I am logged in as an admin
  When I click the email link on the header
    And I click Send Email
    And I fill in subject and content
    And I click Send
  Then the email should be sent to subscribers
