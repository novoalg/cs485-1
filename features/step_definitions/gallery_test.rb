When(/^I go to the gallery page$/) do
  visit root_path
  click_link "Gallery"
end

When(/^I click new entry$/) do
  click_link "New Gallery Entry"
end

When(/^I enter a description$/) do
  @sr = SecureRandom.hex
end

When(/^I select an image$/) do
end

When(/^I click the create button$/) do
end

Then(/^the image should be added to the gallery$/) do
end

When(/^I click edit entry$/) do
  first(:link, "Edit").click
end

When(/^I click the update gallery button$/) do
end

When(/^I click delete entry$/) do
  first(:link, "Delete").click
end

When(/^I click the cofirm button$/) do
  click_button "Ok"
end

Then(/^the image should be deleted from the gallery$/) do
  page.should_not have_content @sr
end
