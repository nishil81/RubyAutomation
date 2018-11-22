require 'selenium-webdriver'


# This class contains page elements of FreelancerSearchResults page locators
class FreelancerSearchResultsView

  @@freelancerName_List = "//h4/a[@class='freelancer-tile-name']"
  @@frellancertitle_List = "//h4[contains(@class,'freelancer-tile-title')]"
  @@freelancerDes_List = "//div[contains(@class,'d-none') and @data-profile-description]"
  @@freelancerTile_List = "//article/div[1]"
  @@freelancerNameOnDetailPage = "//div[@class='media-body']//span[@itemprop='name']"

end