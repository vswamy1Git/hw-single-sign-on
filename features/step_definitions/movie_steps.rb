Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create profile
  end 
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to Rotten Potatoes!")
end

Then /^I will see "([^"]*)"$/ do |message|
  puts page.body # <---
  expect(page.body).to have_content(message)
end