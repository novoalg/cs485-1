Given(/^I am on the item category page$/) do
  unless current_path == item_categories_path
    visit item_categories_path
  end
end

Given(/^I click on an item category$/) do
  
end

Then(/^I should see the items in that category$/) do
  pending # express the regexp above with the code you wish you had
end
