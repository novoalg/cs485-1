When(/^I go to the home page$/) do
  visit root_path
end

Then(/^I should see the home page$/) do
  expect(find("#welcome-slider").visible?).to be true
end

Given(/^I am on the home page$/) do
  unless current_path == root_path
    visit root_path
  end
end

When(/^I click the about us link$/) do
  click_link "About Us"
end

Then(/^I should see the about us page$/) do
  expect(page).to have_css('img', 'about-us-img')
end

When(/^I click the contact us link$/) do
  click_link "Contact Us"
end

Then(/^I should see the contact us page$/) do
  expect(page).to have_css('div', 'get-directions')
end

Given(/^I am on the contact us page$/) do
  unless current_path == contact_path
    visit contact_path
  end
end

When(/^I click the get directions button$/) do
  click_link "Get Directions"
end

Then(/^I should see the google maps page$/) do
  expect(!!(current_url =~ /google\.com\/maps/)).to be true
end
