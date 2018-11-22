require 'selenium-webdriver'



=begin
This class contains the methods  related driver initialization
=end

class DriverManager


  def init(browser)

    if browser.to_s.eql? 'chrome'
      chromeDriverPath = File.expand_path('lib/external_libs/chromedriver_win32/chromedriver.exe', Dir.pwd)
      Selenium::WebDriver.logger.info("browser -name  #{chromeDriverPath}")
      Selenium::WebDriver::Chrome.driver_path = chromeDriverPath
      @driver = Selenium::WebDriver.for :chrome

    elsif browser.to_s.eql? 'firefox'
      geckodriverPath = File.expand_path('lib/external_libs/geckodriver_mac/geckodriver', Dir.pwd)
      Selenium::WebDriver::Firefox.driver_path = geckodriverPath
      @driver = Selenium::WebDriver.for :firefox

    end
    Selenium::WebDriver.logger.level = :info
    @driver.manage.delete_all_cookies
    Selenium::WebDriver.logger.info( "Opening upwork home page")
    @driver.navigate.to 'https://upwork.com/'

    return @driver
  end
end






