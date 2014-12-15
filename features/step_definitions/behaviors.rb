Then(/^I should see an error message$/) do
  expect(page).to have_css '.alert-box.alert'
end

Then(/^I should see a success message$/) do
  expect(page).to have_css '.alert-box.success'
end

Then(/^I should see a flash message$/) do
end