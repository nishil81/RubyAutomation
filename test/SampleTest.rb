#require "rubygems"
require_relative "Testhelper"
=begin
require 'test/unit'
require 'selenium-webdriver'
require 'pageobjects/search/FreelancerSearch'
require 'pageobjects/search/FreelancerSearchResults'
require 'utils/DriverManager'
=end


$args = ARGV.dup
class MyTest < Test::Unit::TestCase

  def setup
    @driver = DriverManager.new.init($args[0])
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    @freelancerSearch = FreelancerSearch.new(@driver)
    @freelancerSearchResults = FreelancerSearchResults.new(@driver)
    @freelancerDetails = FreelancerDetails.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_search_freelancer
     keyword = $args[1]
     Selenium::WebDriver.logger.info( "Search keyword in Find Freelancer search box. #{keyword}")
     @freelancerSearch.find_Freelancer(keyword)
     sleep(10)
     Selenium::WebDriver.logger.info( "Parsing the list of freelancere based on search keyword, get Name, Title, Description and Tags.")
     @freelancerList = @freelancerSearchResults.parse_data()
     @freelancerName = @freelancerList[0]['name']

     assert_data(keyword);
     Selenium::WebDriver.logger.info( "Find keyword in all freelacers one by one.")

     Selenium::WebDriver.logger.info( "Select first freelancer form list.")
     @freelancerSearchResults.select_first_freelancer
     sleep(10)
     name = @freelancerDetails.parse_data_on_detailPage
     assert_data_details_page(name)

  end


  def assert_data_details_page(name)

      if @freelancerName.downcase.eql? "#{name.to_s.downcase}"
        Selenium::WebDriver.logger.info( "Keyword #{name.to_s.downcase} found in Name")
      else
        Selenium::WebDriver.logger.info("Keyword #{name.to_s.downcase} Not found in Name")
      end

  end







  def assert_data(keyword)
    for i in 0..@freelancerList.length - 1

      arrayMember = @freelancerList[i]

      Selenium::WebDriver.logger.info("checking #{arrayMember} ")
      if arrayMember['name'].downcase.include? "#{keyword.to_s.downcase}."
        Selenium::WebDriver.logger.info( "Keyword #{keyword.to_s.downcase} found in Name")
      else
        Selenium::WebDriver.logger.info("Keyword #{keyword} Not found in Name")
        end

      if arrayMember['title'].downcase.include? keyword.to_s.downcase
        Selenium::WebDriver.logger.info(  "Keyword #{keyword} found in title")
      else
        Selenium::WebDriver.logger.info(  "Keyword #{keyword} Not found in title")
      end

      if arrayMember['desc'].downcase.include? keyword.to_s.downcase
        Selenium::WebDriver.logger.info(  "Keyword #{keyword.downcase} found in des")
      else
        Selenium::WebDriver.logger.info(  "Keyword #{keyword} Not found in des")
      end

      end
  end
  
end