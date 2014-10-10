require 'watir-webdriver'

browser = Watir::Browser.new :firefox

Before do
  @browser = browser
end

After do |scenario|
  if scenario.failed?
    img_name = "#{Time.now.getutc.to_i}_screenshot.png"
    browser.screenshot.save "reports/#{img_name}"
    embed "#{img_name}", 'image/png'
  end
end
 
at_exit do
  browser.close
end