require 'selenium-webdriver'

=begin
  This module contains the methods to find element/s, this is written to in case if we need to modify the default behaviour
  selenium methods
=end

module Page


 def Page.find_element(driver, element)
   driver.find_element(:xpath, element)
 end
 
  def Page.find_elements(driver, element)
     driver.find_elements(:xpath, element)
   end
end