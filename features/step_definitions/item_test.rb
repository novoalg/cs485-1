When(/^I go to the new item page$/) do
  visit new_item_path
end

Given(/^there is at least one item category$/) do
  unless ItemCategory.all.size > 0
    ItemCategory.create(:name => "Test")
  end
end

When(/^I fill in some details$/) do
  @sr = SecureRandom.hex
  fill_in "Name", :with => "Test#{@sr}"
  fill_in "Description", :with => "Test#{@sr}"
  fill_in "Price", :with => "10.00"
  fill_in "Stock", :with => "20"
end

When(/^I click Create Item$/) do
  click_button "Create Item"
end

Then(/^the item should show up on the items page$/) do
  visit items_path
  expect(page).to have_content @sr
end

When(/^I view the item that was created$/) do
  visit item_path Item.last.id
end

Then(/^I should see the name of that item$/) do
  expect(page).to have_content Item.last.name
end

When(/^I edit the item that was created$/) do
  visit edit_item_path Item.last.id
  @sr = SecureRandom.hex
  fill_in "Name", :with => "Test#{@sr}"
end

When(/^I save the changes$/) do
  click_button "Update Item"
end

Then(/^I should see the changes$/) do
  visit item_path Item.last.id
  expect(page).to have_content Item.last.name
end
