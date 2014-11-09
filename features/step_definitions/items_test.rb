Given(/^I am on the item creation page$/) do
  unless current_path == new_item_path
    visit new_item_path
  end
end

When(/^I enter name (.*?)$/) do |arg1|
  fill_in "Name", :with => arg1
end

When(/^I enter description (.*?)$/) do |arg1|
  fill_in "Description", :with => arg1
end

When(/^I enter price (.*?)$/) do |price|
  fill_in "Price", :with => price
end

When(/^I enter stock (.*?)$/) do |arg1|
  fill_in "Stock", :with => arg1
end

When(/^I enter category (.*?)$/) do |arg1|
  pending
end

Given(/^I click on the items link$/) do
  click_link "Items"
end

When(/^I click on an item$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the item details$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am on the item page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I modify the price field$/) do
  pending # express the regexp above with the code you wish you had
end
