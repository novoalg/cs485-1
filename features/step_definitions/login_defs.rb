Given(/^I am logged out$/) do
  if @browser.link(id: "logout").exists?
    @browser.link(id: "logout").click
  end
end

When(/^I enter username (.*?)$/) do | username |
  @browser.text_field(id: "username").set username
end

When(/^I enter password (.*?)$/) do | password |
  @browser.text_field(id: "password").set password
end

Then(/^I should see the welcome message$/) do
  @browser.div(class: "success").visible?.should == true
end

Then(/^I should see the failure message$/) do
  @browser.div(class: "warning").visible?.should == true
end
