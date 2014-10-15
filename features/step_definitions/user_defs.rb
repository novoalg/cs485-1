When(/^I fill in user details$/) do
  @browser.text_field(:id, "user_username").set "TestUser_#{SecureRandom.uuid}"
  @browser.text_field(:id, "user_email").set "TestUser#{SecureRandom.uuid}@example.com"
  @browser.text_field(:id, "user_password").set "ninjasocks"
  @browser.text_field(:id, "user_password_confirmation").set "ninjasocks"
end

Then(/^I should see a confirmation message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the user details$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I change my name$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the updated user details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The user should no longer exist$/) do
  pending # express the regexp above with the code you wish you had
end
