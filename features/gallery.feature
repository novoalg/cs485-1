Feature: Gallery

Scenario: Add Image to Gallery
  Given I am logged in as an admin
  When I go to the gallery page
    And I click new entry
    And I enter a description
    And I select an image
    And I click the create button
  Then the image should be added to the gallery

Scenario: Edit Image to Gallery
  Given I am logged in as an admin
  When I go to the gallery page
    And I click edit entry
    And I enter a description
    And I click the update gallery button
  Then the image should be added to the gallery
