require 'selenium-webdriver'
require 'utils/Page'
require_relative 'FreelancerDetailsView'

# This is page object file that contains all functions that can be performed related to search
class FreelancerDetails

  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end



  def parse_data_on_detailPage()
    sleep(10)
    name = Page.find_element(@driver, FreelancerDetailsView.class_variable_get(:@@freelancername_title.to_s)).text

  end
end
