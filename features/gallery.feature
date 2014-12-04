Feature: Gallery

Scenario: Add Image to Gallery
  Given I am logged in as an admin
  When I go to the gallery page
    And I click new entry
    And I enter a title
    And I select an image
    And I click the add button
  Then the image should be added to the gallery

Scenario: Edit Image to Gallery
  Given I am logged in as an admin
  When I go to the gallery page
    And I click edit entry
    And I enter a new title
    And I click the update button
  Then the image should be added to the gallery

Scenario: Remove Image from Gallery
  Given I am logged in as an admin
  When I go to the gallery page
    And I click delete entry
    And I click the cofirm button
  Then the image should be deleted from the gallery
