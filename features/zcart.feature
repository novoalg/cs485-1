Feature: Shopping Cart

Scenario: Add Item to Cart
  Given I am logged in
  When I go to an item page
    And I click reserve
  Then the item should be added to the cart

Scenario: Remove Item from Cart
  Given I am logged in
  When I go to the shopping cart
    And I click remove item
  Then the item should be removed from the cart

Scenario: Reserve Cart
  Given I am logged in
  When I go to the shopping cart
    And I click reserve items
  Then the items should be reserved
    And a reservation email should be sent