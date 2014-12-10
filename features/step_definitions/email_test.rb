When(/^I click the email link on the header$/) do
  visit email_templates_path
end

When(/^I click Send Email$/) do
  click_button "Send a New Email"
end

When(/^I fill in subject and content$/) do
  @sr = SecureRandom.hex
  fill_in "Subject ", :with => "Subject #{@sr}"
  fill_in "Body", :with => "Test #{@sr}"
end

When(/^I click Send$/) do
  click_button "Send Email"
end

Then(/^the email should be sent to subscribers$/) do
  expect(page).to have_css('div', 'success')
end
