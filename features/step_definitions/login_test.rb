Given(/^I am logged in as an admin$/) do
  unless current_user.is_admin
    visit new_user_session_path
    fill_in "Email", :with => Rails.application.secrets.admin_email
  end
end

Given(/^I am logged out$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the login link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the login page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am on the login page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter username admin$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter password admin$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the login button$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter password blahblah$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a failure message$/) do
  pending # express the regexp above with the code you wish you had
end
