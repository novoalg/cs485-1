When(/^I click the edit text button above the site description$/) do
  click "Edit Description"
end

When(/^I enter new content$/) do
  @sr = SecureRandom.hex
  fill_in "Text", :with => "Test #{@sr}"
end

When(/^I click the update button$/) do
  click_button "Update"
end

Then(/^the site description should be updated$/) do
  expect(page).to have_css('div', 'success')
end

When(/^I click the edit text button above Our Passion$/) do
  first(:link, "Edit Section").click
end

When(/^I enter a new title$/) do
  @sr = SecureRandom.hex
  fill_in "Title", :with => "Test #{@sr}"
end

Then(/^the about us page should be updated$/) do
  expect(page).to have_css('div', 'success')
end
