require 'watir-webdriver'
require 'rspec'

browser = Watir::Browser.new :firefox

Before do
  browser.driver.manage.timeouts.implicit_wait = 3
  @browser = browser
end

After do |scenario|
  if scenario.failed?
    img_name = "#{Time.now.getutc.to_i}_#{scenario.name.gsub(/[^A-Za-z0-9]/, '_')}_screenshot.png"
    screen = browser.screenshot
    screen.save img_name
    embed img_name, 'image/png'
  end
end
 
at_exit do
  browser.close
end