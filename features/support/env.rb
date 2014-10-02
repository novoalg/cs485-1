require 'watir-webdriver'

browser = Watir::Browser.new :firefox

Before do
  @browser = browser
end

After do |scenario|
  if scenario.failed?
    browser.screenshot.save 'screenshot.png'
    embed 'screenshot.png', 'image/png'
  end
end
 
at_exit do
  browser.close
end