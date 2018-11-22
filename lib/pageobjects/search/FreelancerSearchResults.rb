require 'selenium-webdriver'
require 'utils/Page'
require_relative 'FreelancerSearchResultsView'



# This is page object file that contains all the logical functions that the required to perform on search results.
class FreelancerSearchResults

  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  # Parsing data from freelancer list
  def parse_data()
    sleep(10)
    nameList = Page.find_elements(@driver, FreelancerSearchResultsView.class_variable_get(:@@freelancerName_List.to_s))
    titleList = Page.find_elements(@driver, FreelancerSearchResultsView.class_variable_get(:@@frellancertitle_List.to_s))
    desList = Page.find_elements(@driver, FreelancerSearchResultsView.class_variable_get(:@@freelancerDes_List.to_s))
    listSize = nameList.length

    @freelancerList = []

    for i in 0..listSize - 1

      nameElement = nameList[i]
      name = nameElement.text

      taglist = Page.find_elements(@driver, "//h4/a[@title='#{name}']/../../../..//span[contains(@class,'o-tag-skill')]")

      freelancer = Hash['name' => nameList[i].text,
                        'title' => titleList[i].text,
                        'desc' => desList[i].text,
                        'tag' => taglist]

      @freelancerList << freelancer
    end
    @freelancerList
  end







  # Select first freelancer from list
  def select_first_freelancer


    nameList = Page.find_elements(@driver,FreelancerSearchResultsView.class_variable_get(:@@freelancerTile_List.to_s) )
    nameElement = nameList[0]
    nameElement.location_once_scrolled_into_view
    nameElement.click
  end

end
