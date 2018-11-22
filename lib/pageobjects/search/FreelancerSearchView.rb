require 'selenium-webdriver'


# This class contains page elements of FreelancerSearch component locators
class FreelancerSearchView
  
  @@freelancerSearchBoxArrow_icon = "//*[@id='visitor-nav']/div[1]/form/div/div/div[2]"
  @@findFreelancerOption_text = "//*[@id='visitor-nav']/div[1]/form/div/ul/li[1]/a[@data-qa='freelancer_value']"
  @@findfreelancer_searchbox = "//*[@id='layout']/nav/div/div[2]/div[1]/form/div[3]/input[2]"
  @@findfreelancer_searchIcon = "//*[@id='layout']//button[@type='submit']"
end
