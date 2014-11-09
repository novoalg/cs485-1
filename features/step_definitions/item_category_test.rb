When(/^I go to the new category page$/) do
  visit new_item_category_path
end

When(/^I enter Things as the category name$/) do
  @sr = SecureRandom.hex
  fill_in "name", :with => "Things#{@sr}"
end

When(/^I enter Stuff as the category description$/) do
  fill_in "description", :with => "Stuff"
end

When(/^I save the category$/) do
  click_button "Submit"
end

Then(/^I should see Things in the item category list$/) do
  expect(page).to have_content "Things#{@sr}"
end

When(/^I view the Things category$/) do
  visit item_category_path ItemCategory.last.id
end

Then(/^I should see the category name$/) do
  expect(page).to have_content "Things#{@sr}"
end

When(/^I edit the Things category$/) do
  visit edit_item_category_path ItemCategory.last.id
  step "I enter Things as the category name"
  step "I save the category"
end