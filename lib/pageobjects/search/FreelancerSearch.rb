require 'rubygems'
require 'selenium-webdriver'
require 'utils/Page'
require_relative 'FreelancerSearchView'

# This is page object file that contains all functions that can be performed related to search
class FreelancerSearch

  attr_reader :driver
  def initialize(driver)
    @driver = driver
  end

#seach for the freelancer based on the name
# NOte: Instead of sleep we can use wait utilities
  def find_Freelancer(keyword)
    begin
        Page.find_element(@driver,FreelancerSearchView.class_variable_get(:@@freelancerSearchBoxArrow_icon)).click
        sleep(1)
        Page.find_element(@driver,FreelancerSearchView.class_variable_get(:@@findFreelancerOption_text.to_s)).click
        rescue StandardError => msg
    end
    sleep(2)
    @freelancer_textBox = Page.find_element(@driver,FreelancerSearchView.class_variable_get(:@@findfreelancer_searchbox.to_s))
    @freelancer_textBox.send_keys keyword.to_s
    Page.find_element(@driver,FreelancerSearchView.class_variable_get(:@@findfreelancer_searchIcon.to_s)).click
    sleep(2)
  end
end
