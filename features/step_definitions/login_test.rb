Given(/^I am logged in as an admin$/) do
  puts current_user
  step "I am logged in"
  User.find(current_user.id).update(role_id: 4)
end

Given(/^I am logged out$/) do
  if signed_in?
    sign_out
  end
end

When(/^I click the login link$/) do
  click_link "Login"
end

Then(/^I should see the login page$/) do
  expect(page).to have_css "#login"
end

Given(/^I am on the login page$/) do
  unless current_path == new_user_session_path
    visit new_user_session_path
  end
end

When(/^I enter email (.*?)$/) do |email|
  fill_in "Email", :with => email
end

When(/^I enter password (.*?)$/) do |password|
  fill_in "Password", :with => password
end

When(/^I click the login button$/) do
  click_button "Log In"
end

Then(/^I should see a failure message$/) do
  expect(page).to have_content "Invalid email or password."
end
