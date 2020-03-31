require 'pry'
##Example

Given(/^I am on the homepage$/) do
    find('h1',:text => "Welcome to MyRapName.com")
  end

Then(/^I see the text "(.*?)"$/) do |text|
  page.has_text?(text)
end


##Scenario 1 - Looking for an Input
Then(/^I see three input fields$/) do
  page.has_field?('firstname')
  page.has_field?('shorten')
  page.has_field?('lastinitial')
end


#Scenario 2 - Negative input scenario
When("I type {string} into the firstname field") do |string|
  page.find_field('firstname', with: '').set('@@')
end

And("I click {string}") do |string|
  page.click_button(string)
end

Then(/^The text "(.*?)" should appear$/) do |string|
  page.has_text?(text)
end


##Scenario 3 - Data inputs to a field 
When("I type {string} into the First Name field") do |string|
  page.find_field('firstname', with: '').set('Adam')
end

When("I type {string} into the Last Initial field") do |string|
  page.find_field('lastinitial', with: '').set('N')
end

Then("I can see the data that has been filled in") do
  page.has_text?('Adam')
  page.has_text?('N')
end


#Scenario 4 - Add male name with nickname

When("Select Use Nickname") do
  page.check('shorten')
end

When("I click suggest Male Rap Name") do
  page.click_button('Suggest Male Rap Name')
end

Then("I should see {string} prepended to the list") do |string|
  page.all('h1').last.text.include?(string[0])
end

##Scenario 5 - Add two female names

And("I type {string} into Last Initial field") do |string|
  page.find_field('lastinitial', with: '').set('B')
end

And("I click {string} twice") do |string|
  page.click_button('Suggest Female Rap Name').click
end

Then("I should see two names prepended to the list") do

end


