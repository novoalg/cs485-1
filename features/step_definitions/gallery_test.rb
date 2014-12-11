When(/^I go to the gallery page$/) do
  visit root_path
  click_link "Gallery"
end

When(/^I click new entry$/) do
  click "New Gallery Entry"
end

When(/^I enter a description$/) do
  @sr = SecureRandom.hex
  fill_in "Description", :with => "Test #{@sr}"
end

When(/^I select an image$/) do
  click_button "Browse"
  attach_file("Picture", "/features/step_definitions/UWEC.jpg")
end

When(/^I click the create button$/) do
  click_button "Create Gallery"
end

Then(/^the image should be added to the gallery$/) do
  visit root_path
  click_link "Gallery"
  expect(page).to have_content @sr
end

When(/^I click edit entry$/) do
  first(:link, "Edit").click
end

When(/^I click the update gallery button$/) do
  click_button "Update Gallery"
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
