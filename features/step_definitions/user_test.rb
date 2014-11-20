Given(/^I am not logged in$/) do
  if signed_in?
    sign_out
  end
end

Given(/^I am logged in$/) do
  unless signed_in?
    sign_in
  end
end

When(/^I go to the new user page$/) do
  visit new_user_registration_path
end

When(/^I click sign up$/) do
  click_button "Sign Up"
end

When(/^I fill in user details$/) do
  fill_in "Email", :with => "example@uwec.edu"
  fill_in "Password", :with => "newpassword"
  fill_in "Password confirmation", :with => "newpassword"
end

When(/^I sign up with dummy user details$/) do
  sr = SecureRandom.hex
  fill_in "Email", :with => "example#{sr}@uwec.edu"
  fill_in "Password", :with => "newpassword"
  fill_in "Password confirmation", :with => "newpassword"
  click_button "Sign Up"
  click_link "Logout"
  click_link "Login"
  sign_in("example#{sr}@uwec.edu", "newpassword")
end

When(/^I fill in invalid user details$/) do
  fill_in "Email", :with => "example@uwec.edu"
  fill_in "Password", :with => "pass"
  fill_in "Password confirmation", :with => "newpassword"
end

Given(/^I am on the user page$/) do
  visit "/users/#{current_user.id}"
end

Given(/^I am on the password edit page$/) do
  visit edit_user_registration_path
end

Then(/^I should see the user details$/) do
  expect(page).to have_css "#user-email"
end

When(/^I click the edit profile button$/) do
  click_link "edit-profile"
end

When(/^I change my name$/) do
  @uuid = SecureRandom.uuid
  fill_in "First name", :with => @uuid
end

When(/^I click on the change password link$/) do
  click_link "Change Password"
end

Then(/^I should see the updated user details$/) do
  expect(page).to have_content @uuid
end

When(/^I click the cancel account button$/) do
  @de_id = current_user.id
  click_button "Cancel my account"
  page.driver.browser.switch_to.alert.accept
end

Then(/^the user should no longer exist$/) do
  expect(User.exists?(@de_id)).to be false
end

Then(/^I should see a descriptive error message$/) do
  expect(page).to have_content "prohibited this"
end

When(/^I click the submit button$/) do
  click_button "Submit"
end
