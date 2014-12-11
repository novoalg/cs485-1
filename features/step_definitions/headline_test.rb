When(/^I click headline in the header$/) do
  visit edit_headline_path
end

When(/^I enter a test message$/) do
  @sr = SecureRandom.hex
end

When(/^I set it to active$/) do
end

When(/^I click update$/) do
end

Then(/^I should see the headline on the home page$/) do
  visit root_path
end

When(/^I set it to not active$/) do
end

Then(/^I should not see the headline on the home page$/) do
  visit root_path
end
