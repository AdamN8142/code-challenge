Feature: An Example Feature

Scenario: An example scenario
  Given   I am on the homepage
  Then    I see the text "You don't join us, we join you"

Scenario: Looking for an input
   Given   I am on the homepage
   Then    I see three input fields

Scenario: Negative input scenario
   Given   I am on the homepage
   When    I type "@@" into the firstname field
   And     I click "Suggest Male Rap Name"
   Then    The text "You must enter your first name" should appear
 
Scenario: Data inputs to fields
   Given   I am on the homepage
   When    I type "Adam" into the First Name field
   When    I type "N" into the Last Initial field
   Then    I can see the data that has been filled in 

Scenario: Add male name with nickname
   Given  I am on the homepage
   When   I type "Adam" into the First Name field
   And    Select Use Nickname 
   And    I click suggest Male Rap Name 
   Then   I should see "Adam" prepended to the list 


Scenario: Add two female names 
    Given  I am on the homepage
    When   I type "Adam" into the First Name field
    And    I type "B" into Last Initial field
    And    I click "Suggest Female Rap Name" twice 
    Then   I should see two names prepended to the list 
