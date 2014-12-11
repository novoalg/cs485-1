When(/^I go to an item page$/) do
  visit item_path(Item.first)
end

When(/^I click reserve$/) do
  click_button "Add to Cart"
end

Then(/^the item should be added to the cart$/) do
  visit cart_path
  expect(page).to have_content(Item.first.name)
end

When(/^I go to the shopping cart$/) do
  visit cart_path
end

When(/^I click remove item$/) do
  first(:link, "Remove").click
end

Then(/^the item should be removed from the cart$/) do
  page.should_not have_content(Item.first.name)
end

When(/^I click reserve items$/) do
end

Then(/^the items should be reserved$/) do
end

Then(/^a reservation email should be sent$/) do
end
