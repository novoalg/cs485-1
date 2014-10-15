root = "localhost:3000"

Given(/^I am on the (.*?) page$/) do | page |
  case page
    when /home/
      @browser.goto root unless @browser.url == root
    when /contact us/
      @browser.goto "#{root}/contact" unless @browser.url == "#{root}/contact"
    when /login/
      @browser.goto "#{root}/login" unless @browser.url == "#{root}/login"
    when /user/ 
      @browser.goto "#{root}/users/1" unless @browser.url == "#{root}/users/1"
  end
end

When(/^I go to the (.*?) page$/) do | page |
  case page
    when /home/
      @browser.goto root
    when /contact us/
      @browser.goto "#{root}/contact"
    when /login/
      @browser.goto "#{root}/login"
    when /new user/
      @browser.goto "#{root}/users/new"
  end
end

When(/^I click the (.*?) link$/) do | place |
  case place
    when /about us/
      @browser.link(id: "about-us").click
    when /contact us/
      @browser.link(id: "contact-us").click
    when /login/
      @browser.link(id: "login").click
  end
end

When(/^I click the (.*?) button$/) do | button |
  case button 
    when /get directions/
      @browser.link(id: "get-directions").click
    when /login/
      @browser.button(id: "login").click
    when /submit/
      @browser.button(id: "submit").click
    when /edit profile/
      @browser.link(id: "edit-profile").click
    when /delete user/
      @browser.link(id: "delete-user").click
  end
end

Then(/^I should see the (.*?) page$/) do | page |
  case page
    when /home/
      @browser.div(:class => "welcome-slider").visible?.should == true
    when /about us/
      @browser.div(:id => "history").visible?.should == true
    when /contact us/
      @browser.section(:id => "phone-number").visible?.should == true
    when /login/
      (@browser.text_field(:id => "username").visible? && @browser.text_field(:id => "password").visible?).should == true
    when /google maps/
      @browser.meta(:name => "google").exists?.should == true
  end
end