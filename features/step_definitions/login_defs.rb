Given(/^I am logged in$/) do
  unless @browser.link(id: "logout").exists?
    steps %Q{
      When I go to the login page
      When I enter username admin
      When I enter password admin
      When I click the login button
    }
  end
end

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

Then(/^I should see a (.*) message$/) do | message |
  case message
  when /failure/
    @browser.div(class: "warning").visible?.should == true
  when /success/
    @browser.div(class: "success").visible?.should == true
  end
end