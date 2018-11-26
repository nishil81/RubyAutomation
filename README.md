# RubyAutomation
Ruby automation test with page object model

## Test scenario

1. Run `<browser>`
2. Clear `<browser>` cookies
3. Go to www.upwork.com
4. Focus onto "Find freelancers"
5. Enter `<keyword>` into the search input right from the dropdown and submit it (click on the magnifying glass button)
6. Parse the 1st page with search results: store info given on the 1st page of search results as structured data of any chosen by you type (i.e. hash of hashes or array of hashes, whatever structure handy to be parsed).
7. Make sure at least one attribute (title, overview, skills, etc) of each item (found freelancer) from parsed search results contains `<keyword>` Log in stdout which freelancers and attributes contain `<keyword>` and which do not.
8. Click on random freelancer's title
9. Get into that freelancer's profile
10. Check that each attribute value is equal to one of those stored in the structure created in #67

## Package Structure

### /lib Package:
This folder contains all the external dependencies,binaries, utilies and Page Object that require for the script execution.

```
    lib
    ├── RubySelenium
    ├── external_libs
    │   ├── chromedriver_mac
    │   ├── chromedriver_win32
    │   └── geckodriver_mac
    ├── pageobjects
    │   └── search
    └── utils

```
#### lib/external_libs
1. /external_libs/chromedriver_mac:
   >   Contains "Chrome driver" for Mac OS X.
2. /external_libs/chromedriver_win32:
   > Contains "Chrome driver" for Windows OS.
3. /external_libs/geckodriver_win32:
   > Contains "gecko driver" for mac to run script in Firefox driver.
    
    Add required driver binaries here in future as per need.

#### lib/pageobjects
1. pageobjects/search : Contains pageobject files of webpages releated search scenarios.
    ````
    └── search
        ├── FreelancerDetails.rb
        ├── FreelancerDetailsView.rb
        ├── FreelancerSearch.rb
        ├── FreelancerSearchResults.rb
        ├── FreelancerSearchResultsView.rb
        └── FreelancerSearchView.rb
    ````
   Each webpage has 2 file, 
   1. Logic file, which contains logic of the test(Steps). All Actions on the page defined here.(e.g FreelancerDetails.rb)
   2. Locator file, All the locator of the page are defined in this file.(e.g FreelancerDetailsView.rb) 

#### lib/utils
Its contains, all utility methods that will enhance the productivity and optimise the code. 

```` 
        .
        ├── DriverManager.rb
        └── Page.rb
````

1. utils/Drivermanager.rb :
      
      This class taken care about driver initialisation based in argument passed.
2. utils/Page.rb
  
   This class contains the methods to find element/s, this is written to in case if we need to modify the default behaviour
      selenium methods. We can add more based on requirements.

### /test Package:
This folder contains the test file, which trigger the test.
````
    .
    ├── SampleTest.rb
    └── Testhelper.rb
````
Here SampleTest.rb contains the test, which is execute the Test scenario.
Its further divided in 3 Part:

    -> Setup:  
    1. Its manage driver initialisation.
    3. Time out.
    2. Object allocation.  

    -> Tear down:  
     1. Its trigger once test is failed.
     2. Its will close all Browser session after execution.
     
    --> Test :
     1. Execute require steps by calling defined methods from Pageobject package.
     2. Logs of execution
     3. Assertions 

    * we can also create separate class to manage assestions in needed.
## How to run

Navigate to **/test** folder and run below command,

````
ruby SampleTest.rb chrome java
````

