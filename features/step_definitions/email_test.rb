When(/^I click the email link on the header$/) do
  visit email_templates_path
end

When(/^I click Send Email$/) do
  click_link "Send a new email"
end

When(/^I fill in subject and content$/) do
  @sr = SecureRandom.hex
  fill_in "Subject", :with => "Subject #{@sr}"
end

When(/^I click Send$/) do
  click_button "Send Email"
end

Then(/^the email should be sent to subscribers$/) do
end
