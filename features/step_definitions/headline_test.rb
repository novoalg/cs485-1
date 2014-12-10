When(/^I click headline in the header$/) do
  visit edit_headline_path
end

When(/^I enter a test message$/) do
  @sr = SecureRandom.hex
  fill_in "Text", :with => "Test #{@sr}"
end

When(/^I set it to active$/) do
  check("Active?")
end

When(/^I click update$/) do
  click("Update Headline")
end

Then(/^I should see the headline on the home page$/) do
  visit root_path
  page.should have_css('div', 'breaking')
end

When(/^I set it to not active$/) do
  uncheck("Active?")
end

Then(/^I should not see the headline on the home page$/) do
  visit root_path
  page.should_not have_css('div', 'breaking')
end
